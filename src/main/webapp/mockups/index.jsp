<%@ page language="java" import="java.util.*, java.text.*,java.io.*,gov.nysenate.openleg.*,gov.nysenate.openleg.model.*" pageEncoding="UTF-8"%>
<%
	String appPath = request.getContextPath();
	String title = request.getParameter("title");
	if (title == null)
		title = "Open Legislation Service";
	title += " - New York State Senate";
		
	String term = (String)request.getAttribute("term");
	
	if (term == null)
		term = "";
	else
	{
		term = term.replaceAll("\"","&quot;");
	}
	
	String search = (String)request.getAttribute("search");
	if(search == null) {
		search = "";
	}
	else {
		search = search.replaceAll("\"","&quot;");
	}
	
	String searchType = (String)request.getAttribute("type");
	if (searchType == null)
		searchType = "";
%>

<html>
	<head>
		<title><%=title%></title>

		<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=1.0; user-scalable=0;" />
		<meta name="apple-mobile-web-app-capable" content="YES"/>
		<link rel="alternate" type="application/rss+xml" title="RSS 2.0" href="<%=appPath%>/feed" />
		<link rel="shortcut icon" href="<%=appPath%>/img/nys_favicon_0.ico" type="image/x-icon" />
		
		<link rel="stylesheet" type="text/css" media="screen" href="<%=appPath%>/mockups/css/bootstrap.min.css"/>
		<link rel="stylesheet" type="text/css" media="screen" href="<%=appPath%>/mockups/css/style.css"/>
		<link rel="stylesheet" type="text/css" media="print" href="<%=appPath%>/mockups/css/print.css">
		<link rel="stylesheet" type="text/css" href="<%=appPath%>/mockups/css/font-awesome.css">
		
		<script type="text/javascript" src="<%=appPath%>/mockups/js/jquery.js"></script>
		<script type="text/javascript" src="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.js"></script>
	 	<script type="text/javascript" src="<%=appPath%>/mockups/js/bootstrap.js"></script>
	 	<script type="text/javascript" src="<%=appPath%>/mockups/js/app.js"></script>
	</head>
	<body>  
	 <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
            <a class='brand' href="<%=appPath%>/"><img src="<%=appPath%>/mockups/img/open-leg-logo_mid_Web.png" /></a> 
          <div class="nav-collapse">
            <ul class="nav">
                <%if (searchType.startsWith("bill")||searchType.equals("search")||searchType.equals("sponsor")||searchType.equals("committee")){ %>
<li class="active" ><a href="<%=appPath%>/bills/" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
<%}else{ %>
<li class=""><a href="<%=appPath%>/bills/" title="Browse and search Senate and Assembly bills by number, keyword, sponsor and more">Bills</a></li>
<%} %>
<li class="active"><a href="<%=appPath%>/calendars/" title="View recent and search floor calendars and active lists by number or date (i.e. 11/07/2009)">Calendars</a></li>
<li <%if (searchType.startsWith("meeting")){%>class="active"<%} %> ><a href="<%=appPath%>/meetings/" title="View upcoming and recent committee meetings, and search by committee, chairperson, location, date (i.e. 11/07/2009) and more.">Meetings</a>
  <li <%if (searchType.startsWith("transcript")){%>class="active"<%} %>><a href="<%=appPath%>/transcripts/" title="View and search Senate floor full text transcripts">Transcripts</a></li>	
<li <%if (searchType.startsWith("action")){%>class="active"<%} %>><a href="<%=appPath%>/actions/" title="View and filter Floor Actions on Bills from the Floor of the Senate">Actions</a></li>
  <li <%if (searchType.startsWith("vote")){%>class="active"<%} %>><a href="<%=appPath%>/votes" title="Recent committee and floor votes on Senate bills">Votes</a></li>
<% if(searchType.matches("(sponsor|bill|calendar|meeting|transcript|action|vote).*?")) { term = ""; } %>
<li class=""><a href="<%=appPath%>/senators">Sponsor</a></li>
<li class=""><a href="<%=appPath%>/committees">Committee</a></li>
            
         
            </ul>
          
            <div class='menu_search span12'>
          <fieldset>
            <div class="control-group">
            <div class="controls docs-input-sizes">
			<div class="input-append">
				<input class="span4" id="appendedInputButton" placeholder="Search"  type="search"><select name="type" class="span3">
                <option value="">All Types</option>
                <option value="bill">Bills (Senate &amp; Assembly)</option>
                <option value="res">Resolutions</option>
                <option value="transcript">Floor Transcripts</option>
                <option value="meeting">Committee Meetings</option>
                <option value="calendar">Floor &amp; Active Calendars</option>
                <option value="action">Bill Actions</option>
                <option value="vote">Floor &amp; Committee Votes</option>
                </select><button class="btn"  type="button">Go!</button>
		  	</div>
        
             <!--  <input type="search"  class="span4">
             <input type="search" id="test" value="Search">
              
				<input type="submit" value="Search"/>--->
            </div>
          </div>
      
         
        </fieldset>
        </div>
          </div><!--/.nav-collapse -->
          
        </div>
      </div>
    </div>

	
 
	<div class="container pagebox">

	<!-- edit this xxx.jsp tag to load the other pages for now -->
	
	<jsp:include page="/mockups/templates/bill.jsp" />
	
	<div class=''><hr/></div>

	<div id="footer" class='row'>
		<div class='span3'>
			<h4>OpenLegislation</h4>
			<h5><a href="#">Bills</a></h5>
			<h5><a href="#">Calendars</a></h5>
			<h5><a href="#">Meetings</a></h5>
			<h5><a href="#">Transcripts</a></h5>
			<h5><a href="#">Actions</a></h5>
			<h5><a href="#">Votes</a></h5>
			<h5><a href="#">Sponsors</a></h5>
			<h5><a href="#">Committees</a></h5>
		
		</div>
		<div class='span3'>
			<h4>Connect</h4>
			<h5><a href="#">Comments</a></h5>
			<h5><a href="#">Privacy</a></h5>
			<h5><a href="#">BillBuzz</a></h5>
		
		</div>
		<div class='span3'>
			<h4><a href="http://nysenate.gov">Nysenate.gov</a></h4>
			<h5><a href="http://nysenate.gov/senators">Senators</a></h5>
			<h5><a href="http://nysenate.gov/committees">Committees</a></h5>
		
		</div>
		<div class='span3'>
			<h5><a href="#">Feedback</a></h5>
			<h5><a href="#">Mobile Access</a></h5>
			<h5><a href="#">Developers</a></h5>
		
		</div>
	</div>
	<hr/>
	<div class='row'>
		<div class='span12'>
		
			<p>
				<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/us/"><img class="cc-logo" alt="Creative Commons License" src="http://i.creativecommons.org/l/by-nc-nd/3.0/us/88x31.png" align='left' /></a>
				<br><br>
				<p>This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/3.0/us/">Creative Commons Attribution-Noncommercial-No Derivative Works 3.0 United States License</a>.
				</p>
				
				<p>Permissions beyond the scope of this license are available at <a cc="http://creativecommons.org/ns#" href="http://www.nysenate.gov/copyright-policy" rel="morePermissions">http://www.nysenate.gov/copyright-policy</a>.
	 			</p>
	 			<p>The software and services provided under this site are offered under the BSD License and the GPL v3 License.
	 			</p>
	 		</p>
		</div>
	</div>
</div>
	</body>
</html>
	
	
	
	