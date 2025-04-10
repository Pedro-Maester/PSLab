
import java.Date;

public class Show {
    private String sid , tipo, titulo, rating , duration,director;
    private String[] cast,country, listed_in;
    private int Release_year;
    private Date Date_added;

    String Mounth_Number(String raw){
        String[] mes = {"January","February","March","April","May","June","July","August","September","October","November","Dezember"};
        String result = raw;
        for(int m = 0;m< mes.length;m+=1 )result = result.replace(mes[m], Integer.toString(m+1));
        return result;
    }

    int get_j_index(String raw,int i){
        int j;
        if(raw.charAt(i) == '"')j = raw.indexOf('"', i+1)+1;
        else j= raw.indexOf(',', i);
        return j;
    }

    public Show(String raw){
        int i = 0;
        int j = this.get_j_index(raw, i);//raw.indexOf(',', i);
        this.sid = raw.substring(i, j);
        i = j+1;
        j = this.get_j_index(raw, i);//raw.indexOf(',', i);
        this.tipo = raw.substring(i,j);
        // consertar o titulo fdp 1103
        i = j+1;
        j = this.get_j_index(raw, i);
        //if(raw.charAt(i)=='\"')j = raw.indexOf('\"', i);
        //else j= raw.indexOf(',', i);
        this.titulo = raw.substring(i,j);
        i = j+1;
        j= this.get_j_index(raw, i);
        
        //if (raw.charAt(i) == '\"')j = raw.indexOf('\"', i);
        //else  j = raw.indexOf(',', i);
        if(i+1 != j)this.director = raw.substring(i,j);
        
        i = j+1;
        //if(raw.charAt(i)=='\"')j = raw.indexOf('\"', i);
        //else j= raw.indexOf(',', i);
        j= this.get_j_index(raw, i);
        this.cast= raw.substring(i,j).replace("\"","").split(",");
        i=j+1;
        j= this.get_j_index(raw, i);
        this.country = raw.substring(i,j).replace("\"","").split(",");
        //MyIO.println(this.country.toString());
        i = j+1;
        j =this.get_j_index(raw, i);

        //Integer.parseInt(this.Mounth_Number(raw.substring(i,j)).replace(",", "").split(" ")[0]);
        String[] data = this.Mounth_Number(raw.substring(i,j)).replace(",", "").split(" ");
        this.Date_added = new Date(Integer.parseInt(data[2].toString()),Integer.parseInt(data[1].toString()),Integer.parseInt(data[0].toString()));
        //this.Date_added = new Date(Integer.parseInt(this.Mounth_Number(raw.substring(i,j)).replace(",", "").split(" ")[2].toString()),Integer.parseInt(this.Mounth_Number(raw.substring(i,j)).replace(",", "").split(" ")[1].toString()),Integer.parseInt(this.Mounth_Number(raw.substring(i,j)).replace(",", "").split(" ")[0].toString()));
        MyIO.println(this.Date_added.toString());
        //entede date
        
        //this.Date_added = raw.substring(i,j).replace("\"","")
        //for(int l = 0; l < this.country.length;l+=1)MyIO.print(this.country[l].toString());
    }
    

}
