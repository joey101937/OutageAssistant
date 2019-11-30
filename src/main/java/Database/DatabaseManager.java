/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Database;

import Database.Entities.AggregateRecord;
import Database.Entities.County;
import Database.Entities.Record;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

/**
 *
 * @author joey101937 <g.uydude@yahoo.com>
 */
public class DatabaseManager {
    
    
    
    private static SessionFactory sFactory;

    public static SessionFactory getSessionFactory() {
        if (sFactory == null) {
            sFactory = createSessionFactory();
        }
        return sFactory;
    }
    
    public static List<AggregateRecord> getAllAggregateRecords() {
        Session session = null;
        List<AggregateRecord> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            output = session.createQuery("from aggregateRecords c order by 'time'").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }

    /**
     * creates session factory with the config file and adds annotated entity
     * classes
     */
    private static SessionFactory createSessionFactory() {
        try {
            SessionFactory sessionFactory;
            Configuration configuration = new Configuration();
            configuration.configure("hibernate.cfg.xml");
            configuration.addAnnotatedClass(County.class);
            configuration.addAnnotatedClass(Record.class);
            configuration.addAnnotatedClass(AggregateRecord.class);
            StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().applySettings(
                    configuration.getProperties()).build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
            return sessionFactory;
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("CRITICAL ERROR unable to generate session factory");
            System.exit(-1);
            return null;
        }
    }

    public static List<County> getAllCounties() {
        Session session = null;
        List<County> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            output = session.createQuery("from counties c order by 'name'").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }

    public static County getCountyById(int id) {
        Session session = null;
        County out = null;
        try {
            session = getSessionFactory().openSession();
            out = session.get(County.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return out;
    }

    public static County getCountyByName(String name) {
        Session session = null;
        List<County> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            output = session.createQuery("from counties c where c.name='" + name + "'").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        if (output == null || output.isEmpty()) {
            return null;
        } else {
            return output.get(0);
        }
    }

    public static List<Record> getRecordsByCounty(int countyId) {
        Session session = null;
        List<Record> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            output = session.createQuery("from records r where r.county.id=" + countyId + "").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }
    
        public static List<Record> getRecordsByCounties(List<Integer> countyIds, PaginationSettings ps) {
        Session session = null;
        List<Record> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            String whereClause = "";
            for(Integer i : countyIds){
                whereClause+= "r.county.id = " + i;
                if(countyIds.indexOf(i)!=countyIds.size()-1){
                    whereClause += " OR ";
                }
            }
            String queryString = "from records r where "+ whereClause + "";
            if(ps!=null && ps.orderBy !=null){
                queryString += " order by " + ps.orderBy+" DESC";
            }
            Query query =  session.createQuery(queryString);
            
            if(ps!=null){
                query.setFirstResult(calculateOffset(ps.pageNumber,ps.pageSize));
                System.out.println("first result is " + query.getFirstResult());
                query.setMaxResults(ps.pageSize);
                System.out.println("max results is " + query.getMaxResults());
            }
            
            output = query.getResultList();
            
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }

    public static List<Record> getTodaysRecords() {
        Session session = null;
        List<Record> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            LocalDate date = LocalDate.now();
            date = date.minusDays(1);
            Query query = session.createQuery("from records r where r.time > '" + date.format(DateTimeFormatter.ISO_DATE) + "' group by countyID");
            output = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }

    /**
     * returns all records with a timestamp within a given number of days in
     * the past. Ie: get all records from the past 2 days.
     * @param numDays number of days back to go
     * @return list of records
     */
    public static List<Record> getRecentRecords(int numDays, PaginationSettings ps) {
        Session session = null;
        List<Record> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            LocalDate date = LocalDate.now();
            date = date.minusDays(numDays);
            String queryString = "from records r where r.time > '" + date.format(DateTimeFormatter.ISO_DATE) + "' group by countyID";
            if(ps!=null && ps.orderBy !=null){
                queryString += " order by " + ps.orderBy+" DESC";
            }
            System.out.println("query string is " + queryString);
            Query query = session.createQuery(queryString);
            if(ps!=null){
                query.setFirstResult(calculateOffset(ps.pageNumber,ps.pageSize));
                System.out.println("first result is " + query.getFirstResult());
                query.setMaxResults(ps.pageSize);
                System.out.println("max results is " + query.getMaxResults());
            }
            output = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }
    
    
    
    /**
     * returns all records with a timestamp within a given number of days in
     * the past. Ie: get all records from the past 2 days.
     * @param numDays number of days back to go
     * @return list of records
     */
    public static List<Record> getRecentRecords(int numDays) {
        Session session = null;
        List<Record> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            LocalDate date = LocalDate.now();
            date = date.minusDays(numDays);
            String limit = "";
            Query query = session.createQuery("from records r where r.time > '" + date.format(DateTimeFormatter.ISO_DATE) + "'");
            output = query.getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }
        
    public static List<Record> getAllRecords() {
        Session session = null;
        List<Record> output = new ArrayList<>();
        try {
            session = getSessionFactory().openSession();
            output = session.createQuery("from records r").getResultList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return output;
    }

    public static Record getRecordById(int id) {
        Session session = null;
        Record out = null;
        try {
            session = getSessionFactory().openSession();
            out = session.get(Record.class, id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (session != null) {
            session.close();
        }
        return out;
    }

    
    /**
     * @param page
     * @return
     */
    private static int calculateOffset(int page, int limit) {
        return ((limit * page) - limit);
    }

}
