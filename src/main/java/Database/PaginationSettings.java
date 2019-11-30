/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

/**
 *
 * @author joey101937 <g.uydude@yahoo.com>
 */
public class PaginationSettings {
    public boolean active = true;
    public int pageNumber = 1;
    public int pageSize = 20;
    public String orderBy = null;
    public PaginationSettings(){
        
    }
    public PaginationSettings(int pageNumber, int pageSize){
        this.pageNumber = pageNumber;
        this.pageSize = pageSize;
    }
}
