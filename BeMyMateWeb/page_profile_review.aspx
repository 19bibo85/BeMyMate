<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/page_profile.Master" CodeBehind="page_profile_detail.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">

    <div id="review" class="tab notes active">
	    <form id="reviewForm" runat="server" data-bind="submit: sendReview">
       
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

	    <div id="profileReview" class="comments" data-bind="template: { name: 'profileReviewKOTpl', foreach: Review }"> </div>
            
        <script type="text/html" id="profileReviewKOTpl">
            <div class="row comment" >
			    <div class="col-sm-2">
				    <img src="Content\avatar\placeholder.gif" class="avatar img-responsive" />
			    </div>
			    <div class="col-sm-10">
				    <div class="message clearfix">
					    <header>
						    <span class="name" data-bind="text: Name"></span>
						    <span class="date pull-right" data-bind="text: Data"></span>
					    </header>
					    <div class="note">
						    <p  data-bind="text: Text"></p>
					    </div>
				    </div>
			    </div>
            </div>
        </script>

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

            var reviewModel = {
                Review: ko.observableArray([
                    {
                        Name: 'Info',
                        Data: 'Dataaaaaaaaaaa',
                        Text: 'Textttttttt'
                    },
                    {
                        Name: 'Info',
                        Data: 'Dataaaaaaaaaaa',
                        Text: 'Textttttttt'
                    },
                    {
                        Name: 'Info',
                        Data: 'Dataaaaaaaaaaa',
                        Text: 'Textttttttt'
                    }
                ]),
                sendReview: function (formElement) {
                    var input = "<%= textArea.ClientID%>";
                    if (input != null) {
                        var value = document.getElementById(input).value;
                        if (value != null) {
                            // Get text user name and data
                            this.Review.push({
                                Name: value,
                                Data: "<%= DateTime.Now %>",
                                Text: value
                            });
                        }
                    }
                }
            };
            ko.applyBindings(reviewModel);            
        </script>

</asp:Content>