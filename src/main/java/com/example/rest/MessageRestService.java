package com.example.rest;

import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiResponse;
import com.wordnik.swagger.annotations.ApiResponses;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

/**
 * Created by krishna_hotha on 7/24/16.
 */

@Api("/rest/messages")
@Path("/rest/messages")
public class MessageRestService {


    @GET
    @Path("/{param}")
    @Produces(MediaType.TEXT_PLAIN)
    @ApiOperation(value="get message",httpMethod = "GET",response = String.class)
    @ApiResponses(value={@ApiResponse(code=200,message="success")})
    public String printMessage(@PathParam("param") String msg) {

        String result = "Restful example : " + msg;

        return result;

    }

}
