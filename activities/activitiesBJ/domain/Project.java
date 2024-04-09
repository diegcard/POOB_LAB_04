package domain; 

import java.util.LinkedList;
import java.util.ArrayList;
import java.util.HashMap;

/**
 * This class represents a project that is composed of activities
 * @author POOB  
 * @version ECI 2022
 */

public class Project{
    private HashMap<String,Activity> activities;

    /**
     * Create a Project
     */
    public Project(){
        activities= new HashMap<String,Activity>();
        try {
            addSome();
        } catch (ProjectException e) {
            e.printStackTrace();
            throw new RuntimeException("Error al inicializar Project", e);
        }
    }

    private void addSome() throws domain.ProjectException{
        String [][] activities= {{"Buscar datos","50","15", "" },
                                 {"Evaluar datos","80","20",""},
                                 {"Limpiar datos","100","24",""},
                                 {"Iterar","1000","10",""},
                                 {"Preparar datos", "50", "Secuencial", "Buscar datos\nEvaluar datos\nLimpiar datos"},
                                 {"Iterar 3 veces", "100", "Paralela", "Iterar\nIterar\nIterar"}};
        for (String [] c: activities){
            add(c[0],c[1],c[2],c[3]);
        }
    }

    
    /**
     * Consult a activity
     * @param name
     * @return 
     */
    public Activity consult(String name){
        return activities.get(name.toUpperCase());
    }

    
    /**
     * Add a new activity
     * @param name 
     * @param timeType
     * @param cost
     * @param theActivities
    */
    public void add(String name, String cost, String timeType, String theActivities) throws domain.ProjectException{
        if(activities.containsKey(name.toUpperCase())) throw new ProjectException(ProjectException.DUPLICATE_ACTIVITY);
        if(cost.equals("")) throw new ProjectException(ProjectException.COST_EMPTY);
        if(name.equals("")) throw new ProjectException(ProjectException.DATA_INCOMPLETE);
        int costi = validateCost(cost);
        Activity na;
        if (theActivities.equals("")){
            if(timeType.equals("")) throw new ProjectException(ProjectException.TIME_EMPTY);
            int time = validateTime(timeType);
           na=new Simple(name,costi,time);
        }else{
            if(!(timeType.toUpperCase().equals("SECUENCIAL") || timeType.toUpperCase().equals("PARALELA"))) throw new ProjectException(ProjectException.COMPOSED_ERROR);
            na = new Composed(name,costi,timeType.toUpperCase().charAt(0)=='P');
            addActivitiesToComposed(theActivities, na);
        }
        activities.put(name.toUpperCase(),na);
    }

    private void addActivitiesToComposed(String theActivities, Activity na) {
        String [] aSimples= theActivities.split("\n");
        for (String b : aSimples){
            ((Composed)na).add(activities.get(b.toUpperCase()));
        }
    }

    private int validateTime(String timeType) throws domain.ProjectException {
        try {
            int time = Integer.parseInt(timeType);
            if(time < 1 || time > 24) throw new ProjectException(ProjectException.TIME_ERROR);
            return time;
        } catch (NumberFormatException e) {
            throw new ProjectException(ProjectException.COMPOSED_EMPTY);
        }
    }

    private int validateCost(String cost) throws domain.ProjectException {
        try {
            int costi = Integer.parseInt(cost);
            if(costi<=0) throw new ProjectException(ProjectException.COST_ERROR);
            return costi;
        } catch (NumberFormatException e) {
            throw new ProjectException(ProjectException.COST_ERROR);
        }
    }
    
    /**
     * Consults the activities that start with a prefix
     * @param  
     * @return 
     */
    
    public LinkedList<Activity> select(String prefix){
        LinkedList <Activity> answers=new LinkedList<>();
        prefix=prefix.toUpperCase();
        for(String s:activities.keySet()){
            if(activities.get(s).name().toUpperCase().startsWith(prefix.toUpperCase())){
                answers.add(activities.get(s));
            }   
        }
        return answers;
    }

    
    /**
     * Consult selected activities
     * @param selected
     * @return  
     */
    public String data(LinkedList<Activity> selected){
        StringBuffer answer=new StringBuffer();
        answer.append(activities.size()+ " actividades\n");
        for(Activity p : selected) {
            try{
                answer.append('>' + p.data());
                answer.append("\n");
            }catch(ProjectException e){
                answer.append("**** "+e.getMessage()+"\n");
            }
        }    
        return answer.toString();
    }
    
    
     /**
     * Return the data of activities with a prefix
     * @param prefix
     * @return  
     */ 
    public String search(String prefix){
        return data(select(prefix));
    }
    
    
    /**
     * Return the data of all activities
     * @return  
     */    
    public String toString(){
        return data(new LinkedList<>(activities.values()));
    }
    
    /**
     * Consult the number of activities
     * @return 
     */
    public int numberActivitys(){
        return activities.size();
    }

}
