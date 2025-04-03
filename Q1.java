import java.io.File;
import java.util.Scanner;

public class Q1 {
public static void main(String[] args) {
        File file = new File("tmp/disneyplus.csv");
        
        //File file = new File("/tmp/disneyplus.csv"); verde
        try{
            Scanner scan = new Scanner(file);
            String raw_show= scan.nextLine();
            Show[] shows = new Show[1368];
            int i = 0;
        while(scan.hasNext()){
            raw_show = scan.nextLine();
            //MyIO.print(raw_show);
            shows[i] = new Show(raw_show);
            
            i += 1;
        }
        //MyIO.print(raw_show);
        scan.close();
        }catch (Exception e){
            System.out.println("Erro");
            return;
        }
         
        
    }
}
