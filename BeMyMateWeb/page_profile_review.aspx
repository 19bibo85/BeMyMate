﻿<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/page_profile.Master" CodeBehind="page_profile_detail.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">

    <div id="review" class="tab notes active">
        <%--<div id="reviewSubmit" data-bind="template: { name: 'profileAreaReviewSubmitTpl', foreach: Areas }"></div>--%>

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

        <script type="text/html" id="profileAreaReviewSubmitTpl">            
            <div data-bind="attr: { id: 'submit_rating_id_' + AreaId }" style="display:inline-block;"></div>
        </script>

       <!-- Sort review has been disabled -->
	   <%-- <div class="filter clearfix">
		    <h4 class="pull-left"></h4>

		    <form class="pull-right">
			    <select data-smart-select>
				    <option>Sort by...</option>
				    <option>Date</option>
				    <option>User</option>
				    <option>Attachments</option>
			    </select>
		    </form>
	    </div>  --%>      

        
	    <div id="profileReview" class="comments" data-bind="template: { name: 'profileReviewTpl', foreach: Reviews, as: 'review' }"> </div>
         
        <!-- Template for review -->
        <script type="text/html" id="profileReviewTpl">
            <div class="row comment" >
			    <div class="col-sm-2">
				    <img src="Content\avatar\placeholder.gif" class="avatar img-responsive" />
			    </div>
			    <div class="col-sm-10">
				    <div class="message clearfix">
					    <header>                            
                            <div data-bind="template: { name: 'profileAreaReviewTpl', foreach: Areas }"></div>
					    </header>
					    <div class="note">
						    <p data-bind="text: MessageText"></p>
					    </div>
                        <div data-bind="visible: IsEditVisible" style="display:inline-block;">
                            <button data-bind="attr: { id: 'edit_id_' + review.MessageId }, click: $parent.editReview">Edit</button>
                        </div>
                        <div data-bind="visible: IsDeleteVisible"style="display:inline-block;">
                            <button data-bind="attr: { id: 'delete_id_' + review.MessageId }, click: $parent.deleteReview.bind($data, review)">Delete</button>
                        </div>
                        <div data-bind="visible: IsReportVisible"style="display:inline-block;">
                            <button data-bind="attr: { id: 'report_id_' + review.MessageId }, click: $parent.reportReview">Report</button>
                        </div>
                        <span class="date pull-right" data-bind="text: Date"></span>
				    </div>
			    </div>
            </div>
        </script>

        <!-- Template for review stars -->
        <script type="text/html" id="profileAreaReviewTpl">
            <div data-bind="text: AreaName" style="display:inline-block;"></div>            
            <div data-bind="attr: { id: 'rating_id_' + review.MessageId + '_' + AreaId }, setRatingWidget: AreaValue" style="display:inline-block;"></div>            
        </script>

	    <%--<div class="load-more">
		    <a href="#" class="btn btn-default">Load more comments</a>
	    </div>--%>
    </div>

    <div id="window" hidden="hidden">
        <div id="windowHeader" data-bind="submit: sendEditReview">          
		    <div class="editor clearfix">                
                <textarea id="reviewEditWnd" class="form-control" rows="4"></textarea>
			    <div class="options clearfix">
                    <button
                        id="reviewEditBtn"
                        type="submit">
					    <span>Submit note</span>
				    </button>
			    </div>
		    </div>
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

            ko.bindingHandlers.setRatingWidget = {
                update: function (element, valueAccessor) {
                    // This will be called once when the binding is first applied to an element,
                    // and again whenever any observables/computeds that are accessed change
                    // Update the DOM element based on the supplied values here.
                    $("#" + element.id).jqxRating({ width: 350, height: 35, disabled: true, value: valueAccessor(), theme: 'bootstrap' });
                }
            };

            //ko.bindingHandlers.setEditWidget = {
            //    update: function (element, valueAccessor) {
            //        // This will be called once when the binding is first applied to an element,
            //        // and again whenever any observables/computeds that are accessed change
            //        // Update the DOM element based on the supplied values here.
            //        $("#" + element.id).jqxButton({ width: '50', disabled: valueAccessor() });
            //    }
            //};

            //ko.bindingHandlers.setDeleteWidget = {
            //    update: function (element, valueAccessor) {                    
            //        // This will be called once when the binding is first applied to an element,
            //        // and again whenever any observables/computeds that are accessed change
            //        // Update the DOM element based on the supplied values here.
            //        $("#" + element.id).jqxButton({ width: '50', disabled: valueAccessor() });
            //    }
            //};

            var reviewModel = {
                Reviews: ko.observableArray([
                    {
                        Areas: [
                            {
                                AreaId: '1',
                                AreaName: 'Detail 1',
                                AreaValue: 4
                            },
                            {
                                AreaId: '2',
                                AreaName: 'Detail 2',
                                AreaValue: 3,
                            },
                            {
                                AreaId: '3',
                                AreaName: 'Detail 3',
                                AreaValue: 2
                            }],
                        Date: "<%= DateTime.Now %>",
                        MessageId: 1,
                        MessageText: 'This is just an example 1',
                        IsEditVisible: true,
                        IsDeleteVisible: true,
                        IsReportVisible: true
                    },
                    {
                        Areas: [
                            {
                                AreaId: '1',
                                AreaName: 'Detail 1',
                                AreaValue: 5
                            },
                            {
                                AreaId: '2',
                                AreaName: 'Detail 2',
                                AreaValue: 5,
                            },
                            {
                                AreaId: '3',
                                AreaName: 'Detail 3',
                                AreaValue: 5
                            }],
                        Date: "<%= DateTime.Now %>",
                        MessageId: 2,
                        MessageText: 'This is just an example 2',
                        IsEditVisible: true,
                        IsDeleteVisible: true,
                        IsReportVisible: true
                    },
                    {
                        Areas: [
                            {
                                AreaId: '1',
                                AreaName: 'Detail 1',
                                AreaValue: 5
                            },
                            {
                                AreaId: '2',
                                AreaName: 'Detail 2',
                                AreaValue: 5,
                            },
                            {
                                AreaId: '3',
                                AreaName: 'Detail 3',
                                AreaValue: 5
                            }],
                        Date: "<%= DateTime.Now %>",
                        MessageId: 3,
                        MessageText: 'This is just an example 3',
                        IsEditVisible: true,
                        IsDeleteVisible: true,
                        IsReportVisible: true
                    }
                ]),
                sendReview: function (formElement) {
                    var input = "<%= textArea.ClientID%>";
                    if (input != null) {
                        var value = document.getElementById(input).value;                        
                        if (value != "") {
                            // Get text user name and data
                            this.Reviews.push({
                                Areas: [
                                {
                                    AreaId: '1',
                                    AreaName: 'Detail 1',
                                    AreaValue: 5
                                },
                                {
                                    AreaId: '2',
                                    AreaName: 'Detail 2',
                                    AreaValue: 5,
                                },
                                {
                                    AreaId: '3',
                                    AreaName: 'Detail 3',
                                    AreaValue: 5
                                }],
                                Date: "<%= DateTime.Now %>",
                                MessageId: 4,
                                MessageText: value
                            });
                        }
                    }
                },
                editReview: function () {
                    // In case edit has been pressed show the window
                    $('#window').jqxWindow({
                        showCollapseButton: true, maxHeight: 400, maxWidth: 700, minHeight: 175, minWidth: 200, height: 175, width: 500,
                        initContent: function () {
                            $('#window').jqxWindow('focus');
                        }
                    });
                    $('#window').jqxWindow('open');
                },
                deleteReview: function (reviewToDel) {
                    if (reviewToDel != null) {
                        var con = confirm('Are you sure to delete this review?');
                        if (con == true) {
                            reviewModel.Reviews().splice(reviewToDel);
                            alert("Review has been removed correctly!!!");
                        }
                    }
                },
                reportReview: function () {
                    alert("Review has been reported correctly!!! An email has been sent to our team!!!");
                },
                sendEditReview: function () {
                    alert("send");
                },
            };
            ko.applyBindings(reviewModel);

            
            //var reviewSubmitModel = {
            //    Areas: ko.observableArray([
            //        {
            //            AreaId: '1',
            //            AreaName: 'Detail 1'
            //        },
            //        {
            //            AreaId: '2',
            //            AreaName: 'Detail 2'
            //        },
            //        {
            //            AreaId: '3',
            //            AreaName: 'Detail 3'
            //        }
            //    ])
            //};
            //ko.applyBindings(reviewSubmitModel, 'reviewSubmit');
        </script>

</asp:Content>