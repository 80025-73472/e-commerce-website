/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.learn.mycart.helper;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 *
 * @author rishi
 */
public class FactoryProvider {
    private static SessionFactory factory ;
            public static SessionFactory getFactory(){
                try{
                    if(factory==null){
                    factory= new Configuration().configure().buildSessionFactory();
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }
                
                return factory;
                
            }

    public static Object gerFactory() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    
}
