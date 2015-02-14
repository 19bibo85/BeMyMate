<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/page_profile.Master" CodeBehind="page_profile_detail.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">

    <div id="review" class="tab notes active">
	    <form runat="server">
       
		    <div class="editor clearfix">
                 <asp:TextBox 
                             ID="textArea"
                             Rows="4"
                             runat="server"
                             TextMode="MultiLine" 
                             CssClass="form-control"></asp:TextBox>

			    <div class="options clearfix">
                    <button
                        id="SubReview"
                        type="submit">
					    <span>Submit note</span>
				    </button>
				    <%--<button
                        data-role="button"
                        data-bind="events: { click: onClick }"
                        type="submit">
					    <span>Submit note</span>
				    </button>--%>
			    </div>
		    </div>
	    </form>

	    <div class="filter clearfix">
		    <h4 class="pull-left"></h4>

		    <form class="pull-right">
			    <select data-smart-select>
				    <option>Sort by...</option>
				    <option>Date</option>
				    <option>User</option>
				    <option>Attachments</option>
			    </select>
		    </form>
	    </div>

	    <div id="profileReview" class="comments">        

            <!-- Profile Review template -->     
            <script id="profileReviewTpl" type="x-tmpl-mustache">
                {{#Review}}
			    <div class="row comment">
				    <div class="col-sm-2">
					    <img src="Content\avatar\placeholder.gif" class="avatar img-responsive" />
				    </div>
				    <div class="col-sm-10">
					    <div class="message clearfix">
						    <header>
							    <span class="name">{{Name}}</span>
							    <span class="date pull-right">{{Data}}</span>
						    </header>
						    <div class="note">
							    <p>
								    {{Text}}
							    </p>
						    </div>
					    </div>
				    </div>
			    </div>
                {{/Review}}
            </script>
	    </div>

	    <div class="load-more">
		    <a href="#" class="btn btn-default">Load more comments</a>
	    </div>
    </div>

    <!-- Get Configuration data-->
    <script type="text/javascript">
        var api = "<%= ConfigurationManager.AppSettings["ApiPath"] %>";
        var languageCode = "<%= ConfigurationManager.AppSettings["LanguageCode"] %>";
        var profileSectionId = "<%= ConfigurationManager.AppSettings["ProfileSectionId"] %>";
    </script>

     <!-- Populate after retrieve data -->
    <script type="text/javascript">
        $(document).ready(function () {
            var profileReviewTpl = $('#profileReviewTpl').html();
            Mustache.parse(profileReviewTpl);   // optional, speeds up future uses
            var data = {
                Review: [
                    {
                        Name: "Info",
                        Data: "Dataaaaaaaaaaa",
                        Text: "Textttttttt"
                    },
                    {
                        Name: "Info",
                        Data: "Dataaaaaaaaaaa",
                        Text: "Textttttttt"
                    }
                ]
            };

            var rendered = Mustache.render(profileReviewTpl, data);
            $('#profileReview').html(rendered);
        });
    </script>

    <script>
        $("#SubReview").click(function () {
            alert("Handler for .click() called.");
        })
        <%--var viewModel = kendo.observable({
            onClick: function () {
                $("#<%=textArea.ClientID%>");
            }
        });
        kendo.bind($("#review"), viewModel);--%>
    </script>

</asp:Content>