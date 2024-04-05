package domain;  
 
import java.util.ArrayList;

public class Composed extends Activity{
   
    private boolean parallel;
    private ArrayList<Activity> activities;
    
    /**
     * Constructs a new composed activity
     * @param name 
     * @param cost
     * @param parallel
     */
    public Composed(String name, Integer cost, boolean parallel){
        super(name,cost);
        this.parallel=parallel;
        activities= new ArrayList<Activity>();
    }


    

     /**
     * Add a new activity
     * @param a
     */   
    public void add(Activity a){
        activities.add(a);
    }
       
 
    @Override
    public int cost(){
        return 0;
    }
    
    
    @Override
    public int time() throws ProjectException{
        return 0;
    };
    
    
     /**
     * Calculates an estimated price using default values when necessary
     * @param dUnknown
     * @param dError
     * @param dEmpty
     * @return 
     */
    public int time(int dUnknow, int dError, int dEmpty){
        return 0;
    } 
    
    
     /**
     * Calculate an estimated price considering the modality, if is possible.
     * @param modality ['A'(verage), 'M' (ax)] Use the average or maximum time of known activities to estimate unknown ones or those with error.
     * @return 
     * @throws ProjectException  IMPOSSIBLE, if it can't be calculated
     * /
    public int time(char modality){
        return 0;
    } 
    
     /**
     * Calculates an time of a subactivity
     * @return 
     * @throws ProjectException UNKNOWN, if it doesn't exist. IMPOSSIBLE, if it can't be calculated
     */
    public int time(String activity) throws ProjectException{
        return 0;
    }   
    
    

    
    @Override
    public String data() throws ProjectException{
        StringBuffer answer=new StringBuffer();
        answer.append(name+". Tipo "+ (parallel ? "Paralela": "Secuencial")+". ");
        for(Activity b: activities) {
            answer.append("\n\t"+b.data());
        }
        return answer.toString();
    } 
    

}
