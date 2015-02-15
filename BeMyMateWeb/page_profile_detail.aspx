<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/page_profile.Master" CodeBehind="page_profile_detail.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">

    <div class="tab notes active">        
        <div id="profileDetailInfos">            
            <script id="profileDetailInfosTpl" type="x-tmpl-mustache">                            
                {{#Areas}}
                <div>
                   <h4> {{AreaName}} </h4>
                </div>

                <div>
                    <div>
                    {{#QuestionnaireAnswers}}
                        <label>{{QuestionnaireName}}</label>
					    <div>{{AnswerName}}</div>
                    {{/QuestionnaireAnswers}}
                    </div>   
                </div>
                {{/Areas}}                 
            </script>            
        </div>
    </div>

    <!-- Get Configuration data-->
    <script type="text/javascript">
        var api = "<%= ConfigurationManager.AppSettings["ApiPath"] %>";
        var languageCode = "<%= ConfigurationManager.AppSettings["LanguageCode"] %>";
        var profileSectionId = "<%= ConfigurationManager.AppSettings["ProfileSectionId"] %>";
    </script>

    <!-- Populate Detail Info Data -->
	<script type="text/javascript">
	    var ProfileDetailInfos = {
	        ServiceAPI: api,
	        GetDetailInfos: function () {
	            try {
	                $.ajax({
	                    url: this.ServiceAPI + 'users/ProfileDetailInfos?languageCode=' + languageCode,
	                    type: "GET",
	                    contentType: "application/json; charset=utf-8",
	                    dataType: "json",
	                    async: true,
	                    success: function (response) {
	                        ProfileDetailInfos.Success(response);
	                    },
	                    error: function (error) { ProfileDetailInfos.Error(error); },
	                });
	            }
	            catch (ex) {
	                alert("An error occurred. Please contact the administrator.");
	            }
	        },
	        Success: function (response) {
	            var profileDetailInfosTpl = $('#profileDetailInfosTpl').html();
	            Mustache.parse(profileDetailInfosTpl);   // optional, speeds up future uses
	            var rendered = Mustache.render(profileDetailInfosTpl, { Areas: response });
	            $('#profileDetailInfos').html(rendered);
	        },
	        Error: function (error) {
	            var err = $.parseJSON(error.responseText);
	            alert(err.ExceptioMessage);
	        }
	    }
	</script>
    
    <!-- Populate after retrieve data -->
    <script type="text/javascript">
        $(document).ready(function () {
            ProfileDetailInfos.GetDetailInfos();
        });
    </script>

</asp:Content>
