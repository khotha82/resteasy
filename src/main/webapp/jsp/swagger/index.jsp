<!DOCTYPE html>

<%@page contentType="text/html"
	import="java.util.*,com.mhhe.openapi.common.OpenAPIConfiguration"%>
<html>
<head>
  <title>Swagger UI</title>
  <link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'/>
  <link href='css/highlight.default.css' media='screen' rel='stylesheet' type='text/css'/>
  <link href='css/screen.css' media='screen' rel='stylesheet' type='text/css'/>
  <script type="text/javascript" src="lib/shred.bundle.js"></script>
  <script src='lib/jquery-1.8.0.min.js' type='text/javascript'></script>
  <script src='lib/jquery.slideto.min.js' type='text/javascript'></script>
  <script src='lib/jquery.wiggle.min.js' type='text/javascript'></script>
  <script src='lib/jquery.ba-bbq.min.js' type='text/javascript'></script>
  <script src='lib/handlebars-1.0.0.js' type='text/javascript'></script>
  <script src='lib/underscore-min.js' type='text/javascript'></script>
  <script src='lib/backbone-min.js' type='text/javascript'></script>
  <script src='lib/swagger.js' type='text/javascript'></script>
  <script src='swagger-ui.js' type='text/javascript'></script>
  <script src='lib/highlight.7.3.pack.js' type='text/javascript'></script>
  <script type="text/javascript">


    $(function () {
		
	$("#includedContent").load(".././admin/oauthJS.html"); 
		
      window.swaggerUi = new SwaggerUi({
      url: "openapi/jsp/swagger/service.json",
      dom_id: "swagger-ui-container",
      supportedSubmitMethods: ['get', 'post', 'put', 'delete'],
      onComplete: function(swaggerApi, swaggerUi){
        log("Loaded SwaggerUI")
        $('pre code').each(function(i, e) {hljs.highlightBlock(e)});
      },
      onFailure: function(data) {
        log("Unable to Load SwaggerUI");
      },
      docExpansion: "none"
    });

    $('#input_apiKey').change(function() {
      var key = $('#input_apiKey')[0].value;
      log("key: " + key);
      if(key && key.trim() != "") {
        log("added key " + key);
        window.authorizations.add("key", new ApiKeyAuthorization("api_key", key, "query"));
      }
    })
    window.swaggerUi.load();
  });


    function getSwaggerData(url1, method){
    	swaggerData = '';
        	$.ajax({
        		type : "GET",
        		url : "/openapi/admin/authServlet?url="+url1+"&method="+method,
        		async : false,
        		cros : true,
        		success : function(data) {
        		swaggerData = data;
        		},
    			error :function(xhr, textStatus, error) {
    			}
         	});
         	return swaggerData;
        }
		
  </script>
</head>

<body>
<!--  <div id='header'>
  <div class="swagger-ui-wrap">
    <a id="logo" href="http://swagger.wordnik.com">swagger</a>

    <form id='api_selector'>
      <div class='input icon-btn'>
        <img id="show-pet-store-icon" src="images/pet_store_api.png" title="Show Swagger Petstore Example Apis">
      </div>
      <div class='input icon-btn'>
        <img id="show-wordnik-dev-icon" src="images/wordnik_api.png" title="Show Wordnik Developer Apis">
      </div>
      <div class='input'><input placeholder="http://example.com/api" id="input_baseUrl" name="baseUrl" type="text"/></div>
      <div class='input'><input placeholder="api_key" id="input_apiKey" name="apiKey" type="text"/></div>
      <div class='input'><a id="explore" href="#">Explore</a></div>
    </form>
  </div>
</div>  -->

<div id="header">

  <div class="swagger-ui-wrap" style="display:none;">
    <a  style="display:none;" id="logo" href="http://swagger.wordnik.com">swagger</a>
    <form id="api_selector">
      <div class="input icon-btn">
        <img style="display:none;" id="show-pet-store-icon" src="images/pet_store_api.png" title="Show Swagger Petstore Example Apis">
      </div>
      <div class="input icon-btn">
        <img style="display:none;" id="show-wordnik-dev-icon" src="images/wordnik_api.png" title="Show Wordnik Developer Apis">
      </div>
      <div class="input"><input type="text" style="display:none;" placeholder="http://example.com/api" id="input_baseUrl" name="baseUrl"></div>
      <div class="input"><input type="text" style="display:none;" placeholder="api_key" id="input_apiKey" name="apiKey"></div>
      <div class="input"><a style="display:none;" id="explore" href="#">Explore</a></div>
    </form>
  </div>
  <div class="swagger-ui-wrap">
  	<a class="homeLogo large-3 columns header-nav">OpenAPI Documentation</a>
        <!--<div class="header-nav"></div>-->
  </div>
</div>
<div id="body_container">
	 <!-- <div id="message-bar" class="swagger-ui-wrap">
	  &nbsp;
	</div>-->
	
	<div id="header-msg"><strong>Open API</strong> defines a standard set of Restful Services that will enable External Applications to communicate and interface with the MHE Connect platform.
	&nbsp;<br>OpenAPI Restful services are implemented conforming to JAX-RS: Java&trade; API for RESTful Web Services Version. See the spec: <a class="link-msg" href="https://jax-rs-spec.java.net//">https://jax-rs-spec.java.net//</a>
	<br>
	To find more about the API security, please click on the link   <a href="security.html" >Security</a>
	</div>	
	<div id="swagger-ui-container" class="swagger-ui-wrap">
		
	</div> 
		
		
	<div>
	   <iframe src="swaggerApi.html" style="display: none;"></iframe>
	</div> 
	<!--
	<div>
	   <iframe src=".././admin/oauthJS.html" width="700" height = "400"></iframe>
	</div>  
	-->
	<div id="includedContent" style="display: none;"></div>
	
	<div id="swaggerHostUrl" style="display: none;"><% if(OpenAPIConfiguration.getSystemValue("SWAGGER_HOST_URL") != null){%><%= OpenAPIConfiguration.getSystemValue("SWAGGER_HOST_URL") %><%} %></div>
	<div id="swaggerTargetHostUrl" style="display: none;"><% if(OpenAPIConfiguration.getSystemValue("SWAGGER_HOST_URL") != null){%><%= OpenAPIConfiguration.getSystemValue("SWAGGER_TARGET_HOST_URL") %><%} %></div>
	
	<div id="ock" style="display: none;">api_documentation_oauth_key</div>
	<%OpenAPIConfiguration openAPIConfiguration = new OpenAPIConfiguration(); %>
	<div id="osk" style="display: none;"><%= openAPIConfiguration.loadConsumerByConsumerKey("api_documentation_oauth_key").getSecret() %></div>
	
</div>
<div id="footer">
	<div id="footer-msg"><span>&copy; MHEducation</span></div>
</div>


</body>

</html>
