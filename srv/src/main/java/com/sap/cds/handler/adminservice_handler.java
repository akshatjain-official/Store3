package com.sap.cds.handler;

import jakarta.annotation.PostConstruct;
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

import cds.gen.admin_service.AdminService_;
import cds.gen.adminstore.Adminstore_;
import cds.gen.adminstore.Localbooks_;
import cds.gen.adminstore.Localattachment_;

@Component
@ServiceName(Adminstore_.CDS_NAME)
public class adminservice_handler implements EventHandler {
    @Autowired
    @Qualifier(AdminService_.CDS_NAME)
    RemoteService remoteService;

    @On(entity = { Localbooks_.CDS_NAME, Localattachment_.CDS_NAME })
    Result readSuppliers(CdsReadEventContext context) {
        System.out.println("SERVICE HANDLER IS RUNNING #102");
        return remoteService.run(context.getCqn());
    }

    @PostConstruct
    public void init() {
        System.out.println("VCAP_SERVICES: " + System.getenv("VCAP_SERVICES"));
    }
}