
import java.util.Date;

public class Show {
    private String sid , tipo, titulo, rating , duration,director;
    private String[]  cast, country, listed_in;
    private int Release_year;
    private Date Date_added;
    public Show(String raw){
        int i = 0;
        int j = raw.indexOf(',', i);
        this.sid = raw.substring(i, j);
        i = j+1;
        j = raw.indexOf(',', i);
        this.tipo = raw.substring(i,j);
        // consertar o titulo fdp 1103
        i = j+1;
        j = raw.indexOf(',', i);
        this.titulo = raw.substring(i,j);
        i = j+1;
        if (raw.charAt(i) == '\"'){
            j = raw.indexOf('\"', i);
        }else{
            j = raw.indexOf(',', i);
        }
        this.director =  raw.substring(i,j);
        MyIO.print(this.director+'\n');

        
    }
    

}
