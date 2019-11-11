/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import Database.Entities.Record;
import java.util.List;

/**
 *
 * @author joey101937 <g.uydude@yahoo.com>
 */
public class dbTest {
    public static void main(String[] args) {
        List<Record> l = DatabaseManager.getAllRecords();
        System.out.println("done");
    }
}
