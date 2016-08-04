package com.example.rest;

import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiResponse;
import com.wordnik.swagger.annotations.ApiResponses;

import javax.ws.rs.*;
import javax.ws.rs.core.MediaType;

/**
 * Created by krishna_hotha on 7/24/16.
 */

@Api("/rest/messages")
@Path("/rest/messages")
public class MessageRestService {


    @POST
    @Path("/{param}")
    @Consumes(MediaType.APPLICATION_JSON)
    @Produces(MediaType.APPLICATION_JSON)
    @ApiOperation(value="get message",httpMethod = "POST",response = TestResponse.class ,produces = MediaType.APPLICATION_JSON,consumes = MediaType.APPLICATION_JSON)
    @ApiResponses(value={@ApiResponse(code=200,message="success",response = TestResponse.class )})
    public TestResponse printMessage(@PathParam("param") TestResponse msg) {

        String result = "Restful example : " + msg.getName();

        return new TestResponse(result);

    }

}
