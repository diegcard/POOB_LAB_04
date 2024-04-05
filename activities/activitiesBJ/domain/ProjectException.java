package domain;


/**
 * Write a description of class ProjectException here.
 * 
 * @author (your name) 
 * @version (a version number or a date)
 */
public class ProjectException extends Exception{

    public static final String TIME_EMPTY = "El Tiempo no puede ser vacio";
    public static final String TIME_ERROR = "Error en el tiempo";
    public static final String COMPOSED_EMPTY = "Las actividades no pueden ser vacias";

    
    
    public ProjectException(String message){
        super(message);
    }
}
