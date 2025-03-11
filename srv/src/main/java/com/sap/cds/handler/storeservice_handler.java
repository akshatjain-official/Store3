package com.sap.cds.handler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import com.sap.cds.Result;
import com.sap.cds.services.EventContext;
import com.sap.cds.services.cds.CdsReadEventContext;
import com.sap.cds.services.cds.CqnService;
import com.sap.cds.services.cds.RemoteService;
import com.sap.cds.services.handler.EventHandler;
import com.sap.cds.services.handler.annotations.On;
import com.sap.cds.services.handler.annotations.Before;
import com.sap.cds.services.handler.annotations.ServiceName;
import com.sap.cds.services.persistence.PersistenceService;

import cds.gen.catalog_service.CatalogService_;
import cds.gen.storeservice.Storeservice_;
import cds.gen.storeservice.Localattachment_;
import cds.gen.storeservice.Localbooks_;
import cds.gen.storeservice.Notebooks_;

@Component
@ServiceName(Storeservice_.CDS_NAME)
public class storeservice_handler implements EventHandler{
    @Autowired
    @Qualifier(CatalogService_.CDS_NAME)
    RemoteService remoteService;
    @On(entity = {Localbooks_.CDS_NAME,Localattachment_.CDS_NAME})
    Result readSuppliers(CdsReadEventContext context){
        System.out.println("SERVICE HANDLER IS RUNNING #102");
        return remoteService.run(context.getCqn());
    }

    @Autowired
    PersistenceService persistenceService;
    @Before(event = {CqnService.EVENT_READ},entity= Notebooks_.CDS_NAME)
    public void validation(EventContext context){
        System.out.println("SERVICE HANDLER IS RUNNING #201");

    }

}