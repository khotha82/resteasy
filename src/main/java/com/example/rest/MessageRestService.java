package com.example.rest;

import com.wordnik.swagger.annotations.Api;
import com.wordnik.swagger.annotations.ApiOperation;
import com.wordnik.swagger.annotations.ApiResponse;
import com.wordnik.swagger.annotations.ApiResponses;

import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.Response;

/**
 * Created by krishna_hotha on 7/24/16.
 */

@Api(value = "/MessageRestService", description = "Message Service",
        position = 1)
@Path("/messages")
public class MessageRestService {


    @GET
    @Path("/{param}")
    @ApiOperation(value = "Section Take Assignment Service", response = String.class, notes = "Start the student attempt for the given assignment")
    @ApiResponses(value = {
            @ApiResponse(code = 600, message = "Unexpected database error has occurred while processing the request"),
            @ApiResponse(code = 700, message = "Unexpected system error has occurred while processing th")})
    public Response printMessage(@PathParam("param") String msg) {

        String result = "Restful example : " + msg;
        
        return Response.status(200).entity(result).build();

    }

}
