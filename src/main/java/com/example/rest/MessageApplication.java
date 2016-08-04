package com.example.rest;

import javax.ws.rs.core.Application;
import java.util.HashSet;
import java.util.Set;

/**
 * Created by krishna_hotha on 7/24/16.
 */
public class MessageApplication extends Application{

    private Set<Object> singletons = new HashSet<Object>();
    public MessageApplication() {
        singletons.add(new MessageRestService());




    }
    @Override
    public Set<Object> getSingletons() {
        return singletons;
    }
}
