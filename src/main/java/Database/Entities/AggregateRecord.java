/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database.Entities;

import java.io.Serializable;
import java.sql.Timestamp;
import java.time.format.DateTimeFormatter;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 *
 * @author joey101937 <g.uydude@yahoo.com>
 */
@Entity(name="aggregateRecords")
@Table(name="aggregateRecords")
public class AggregateRecord implements Serializable {
    
    @Id
    private int id;
    @Column
    private int activePowerOutages;
    @Column
    private int customersWithoutPower;
    @Column
    private int NCCustomersWithoutPower;
    @Column
    private int SCCustomersWithoutPower;
    @Column
    private Timestamp time;
    
    public AggregateRecord(){
        
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getActivePowerOutages() {
        return activePowerOutages;
    }

    public void setActivePowerOutages(int activePowerOutages) {
        this.activePowerOutages = activePowerOutages;
    }

    public int getCustomersWithoutPower() {
        return customersWithoutPower;
    }

    public void setCustomersWithoutPower(int customersWithoutPower) {
        this.customersWithoutPower = customersWithoutPower;
    }

    public int getNCCustomersWithoutPower() {
        return NCCustomersWithoutPower;
    }

    public void setNCCustomersWithoutPower(int NCCustomersWithoutPower) {
        this.NCCustomersWithoutPower = NCCustomersWithoutPower;
    }

    public int getSCCustomersWithoutPower() {
        return SCCustomersWithoutPower;
    }

    public void setSCCustomersWithoutPower(int SCCustomersWithoutPower) {
        this.SCCustomersWithoutPower = SCCustomersWithoutPower;
    }

    public Timestamp getTime() {
        return time;
    }

    public void setTime(Timestamp time) {
        this.time = time;
    }
    
        public String getFormattedDate(){
        String out = null;
        try{
            out = getTime().toLocalDateTime().format(DateTimeFormatter.ISO_LOCAL_DATE);
        }catch(Exception e){
            e.printStackTrace();
        }
        return out;
    }
    
    
}
