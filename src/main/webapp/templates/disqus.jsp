<%@ page language="java" contentType="text/html" pageEncoding="utf-8"%>
<%
	String title = request.getParameter("title");
	String disqusUrl = request.getParameter("disqusUrl");
%>

<% if(disqusUrl != null) { %>
<div id="comments">
	<p>
		<b>
			*By contributing or voting you agree to the <a href = "http://nysenate.gov/legal">Terms of Participation</a> and <a href = "http://www.nysenate.gov/privacy-policy">Privacy Policy</a> and verify you are over 13.
		</b>
	</p>
	
	<h3><a name="discuss">Discuss!</a></h3>
	
	<div id="disqus_thread"></div>
		<script type="text/javascript">
		    /* * * CONFIGURATION VARIABLES: EDIT BEFORE PASTING INTO YOUR WEBPAGE * * */
		    var disqus_shortname = 'nysenateopenleg'; // required: replace example with your forum shortname
		
		    // The following are highly recommended additional parameters. Remove the slashes in front to use.
		     var disqus_identifier = '<%=disqusUrl%>';
		     var disqus_url = '<%=disqusUrl%>';
		     var disqus_developer = 0; // developer mode is off
		     var disqus_title = '<%=title%>';
		
		
		    /* * * DON'T EDIT BELOW THIS LINE * * */
		    (function() {
		        var dsq = document.createElement('script'); dsq.type = 'text/javascript'; dsq.async = true;
		        dsq.src = 'http://' + disqus_shortname + '.disqus.com/embed.js';
		        (document.getElementsByTagName('head')[0] || document.getElementsByTagName('body')[0]).appendChild(dsq);
		    })();
		</script>
		<noscript>Please enable JavaScript to view the <a href="http://disqus.com/?ref_noscript">comments powered by Disqus.</a></noscript>
		<a href="http://disqus.com" class="dsq-brlink">blog comments powered by <span class="logo-disqus">Disqus</span></a>

	</div>
<% } %>

