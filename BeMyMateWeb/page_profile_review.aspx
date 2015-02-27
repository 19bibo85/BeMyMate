<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/page_profile.Master" CodeBehind="page_profile_detail.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">

    <div id="review" class="tab notes active">
                
        <div id="starsObvs" data-bind="foreach: Stars">
            <div data-bind="text: AreaName" style="display:inline-block;"></div>            
            <div data-bind="attr: { id: 'stars_id_' + AreaId }, setStarsMain: AreaValue" style="display:inline-block;"></div>
        </div>

        <!-- Submit Form -->
	    <form id="reviewForm" data-bind="submit: sendReview">       
		    <div class="editor clearfix">       
                <textarea 
                    id="textArea" 
                    class="form-control" 
                    rows="4" 
                    style="resize:none"></textarea>
			    <div class="options clearfix">
                    <button
                        id="SubReview"
                        type="submit">
					    <span>Submit note</span>
				    </button>
			    </div>
		    </div>
	    </form>
        
        <!-- Profile Review -->
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
                            <div data-bind="foreach: Areas">
                                <div data-bind="text: AreaName" style="display:inline-block;"></div>            
                                <div data-bind="attr: { id: 'rating_id_' + review.ReviewId + '_' + AreaId }, setRatingWidget: AreaValue" style="display:inline-block;"></div>
                            </div>
					    </header>
					    <div class="note">
						    <p data-bind="text: ReviewText"></p>
					    </div>
                        <div data-bind="visible: IsEditVisible" style="display:inline-block;">
                            <button data-bind="attr: { id: 'edit_id_' + review.ReviewId }, click: $parent.editReview.bind($data, review.ReviewId, review.ReviewText)">Edit</button>
                        </div>
                        <div data-bind="visible: IsDeleteVisible"style="display:inline-block;">
                            <button data-bind="attr: { id: 'delete_id_' + review.ReviewId }, click: $parent.deleteReview.bind($data, review.ReviewId)">Delete</button>
                        </div>
                        <div data-bind="visible: IsReportVisible"style="display:inline-block;">
                            <button data-bind="attr: { id: 'report_id_' + review.ReviewId }, click: $parent.reportReview">Report</button>
                        </div>
                        <span class="date pull-right" data-bind="text: Date"></span>
				    </div>
			    </div>
            </div>
        </script>           

	        <%--<div class="load-more">
		        <a href="#" class="btn btn-default">Load more comments</a>
	        </div>--%>

        <!-- Window for edit review -->
        <div id="window" hidden="hidden">
            <div id="windowHeader"> 
                <div id="starsWnd" data-bind="foreach: Stars">
                    <div data-bind="text: AreaName" style="display:inline-block;"></div>            
                    <div data-bind="attr: { id: 'starsWnd_id_' + AreaId }, setStarsWnd: AreaValue" style="display:inline-block;"></div>
                </div>         
                <form id="reviewEditForm" data-bind="submit: updateReview">
		            <div class="editor clearfix">                
                        <textarea 
                            id="reviewEditWnd" 
                            class="form-control" 
                            rows="4"
                            style="resize:none"></textarea>
			            <div class="options clearfix">
                            <button
                                id="reviewEditBtn"
                                type="submit">
					            <span>Submit note</span>
				            </button>
			            </div>
		            </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Get Configuration data-->
    <script type="text/javascript">
        var api = "<%= ConfigurationManager.AppSettings["ApiPath"] %>";
        var languageCode = "<%= ConfigurationManager.AppSettings["LanguageCode"] %>";
    </script>

    <!-- Populate after retrieve data -->
    <script type="text/javascript">

        // Defining a class for the review
        function ReviewModelObj(){
            var self = this;

            self.Stars = ko.observableArray([]);

            // Retrieve area data from db
            try {
                $.ajax({
                    url: api + 'areas/areas?languageCode=' + languageCode,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (response) {
                        self.Stars(response);
                    },
                    error: function (error) {
                        var err = $.parseJSON(error.responseText);
                        alert(err.ExceptioMessage);
                    },
                });
            }
            catch (ex) {
                alert("An error occurred. Please contact the administrator.");
            }

            ko.bindingHandlers.setStarsMain = {
                init: function (element, valueAccessor, allBindings, viewModel, bindingContext) {
                    // This will be called when the binding is first applied to an element
                    // Set up any initial state, event handlers, etc. here
                },
                update: function (element, valueAccessor) {
                    // This will be called once when the binding is first applied to an element,
                    // and again whenever any observables/computeds that are accessed change
                    // Update the DOM element based on the supplied values here.
                    $("#" + element.id).jqxRating({ width: 350, height: 35, disabled: false, value: valueAccessor(), theme: 'bootstrap' });
                }
            };

            ko.bindingHandlers.setStarsWnd = {
                init: function (element, valueAccessor, allBindings, viewModel, bindingContext) {
                    // This will be called when the binding is first applied to an element
                    // Set up any initial state, event handlers, etc. here
                },
                update: function (element, valueAccessor) {
                    // This will be called once when the binding is first applied to an element,
                    // and again whenever any observables/computeds that are accessed change
                    // Update the DOM element based on the supplied values here.
                    $("#" + element.id).jqxRating({ width: 350, height: 35, disabled: false, value: valueAccessor(), theme: 'bootstrap' });
                }
            };
                                
            self.Reviews = ko.observableArray([]);

            // Add the review into the db and to the viewmodel
            self.sendReview = function (element) {
                var stars = $('#starsObvs');
                if (stars != null) {
                    var form = $(element);
                    if (form != null) {
                        var input = form.find('#textArea');
                        if (input != null) {
                            var value = input.val();
                            if (value !== "") {
                                // Add the obj into the db

                                for (i = 0; i < stars.length; i++) {
                                    alert(stars[i]);
                                }

                                // Get text user name and data
                                self.Reviews.push({
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
                                    Date: "<%= DateTime.UtcNow %>",
                                    ReviewId: 4,
                                    ReviewText: value,
                                    IsEditVisible: true,
                                    IsDeleteVisible: true,
                                    IsReportVisible: true
                                });

                                alert("Review has been insereted corretly!!!");
                                stars.hide();
                                input.val("");
                                form.hide();
                            }
                        }
                    }
                }                
            }

            // Open a window when the user is editing
            self.editReview = function (reviewId, reviewText) {
                // In case edit has been pressed show the window
                $('#window').jqxWindow({
                    title: 'Review',
                    showCollapseButton: true,
                    resizable: false,
                    showCollapseButton: false   ,
                    maxHeight: 500,
                    maxWidth: 700,
                    minHeight: 350,
                    minWidth: 200,
                    height: 350,
                    width: 500
                });

                var form = $('#window').find('#reviewEditForm');
                if (form != null) {
                    form.val(reviewId);
                    var textArea = form.find('#reviewEditWnd');
                    if (textArea !== null) {
                        textArea.val(reviewText);
                        $('#window').jqxWindow('focus');
                        $('#window').jqxWindow('open');
                    }
                }
            }

            // Delete the review
            self.deleteReview = function (reviewId) {
                if (reviewId != null) {
                    var con = confirm('Are you sure to delete this review?');
                    if (con == true) {
                        // Remove message
                        self.Reviews.remove(function (item) {
                            return item.ReviewId == reviewId
                        });
                        alert("Review has been removed correctly!!!");
                    }
                }
            }

            // Send an email to the admin team to make an investigation
            self.reportReview = function () {
                //TODO: Send an email to the administrator team.
                alert("Review has been reported correctly!!! An email has been sent to our team!!!");
            }

            // Once the user edit the review update it
            self.updateReview = function (element) {
                var form = $(element);
                if (form != null) {
                    var input = form.find('#reviewEditWnd');
                    if (input != null) {
                        var reviewText = input.val();
                        if (reviewText != "") {
                            var reviewId = form.val();

                            // Update with new message
                            var updatObj = {
                                Date: "<%= DateTime.UtcNow %>",
                                ReviewId: reviewId,
                                ReviewText: reviewText,
                                IsEditVisible: true,
                                IsDeleteVisible: true,
                                IsReportVisible: true
                            };

                            // Update object into the db
                            try {
                                $.ajax({
                                    url: api + 'reviews/reviews?languageCode=' + languageCode,
                                    type: "GET",
                                    contentType: "application/json; charset=utf-8",
                                    //data: {
                                    //    json: JSON.stringify({ updatObj }),
                                    //    delay: 3
                                    //},
                                    dataType: "json",
                                    async: true,
                                    success: function (response) {
                                        self.Reviews(response);
                                    },
                                    error: function (error) {
                                        var err = $.parseJSON(error.responseText);
                                        alert(err.ExceptioMessage);
                                    },
                                });
                            }
                            catch (ex) {
                                alert("An error occurred. Please contact the administrator.");
                            }


                            <%--// Remove old message
                            self.Reviews.remove(function (item) {
                                return item.reviewId == reviewId
                            });

                            // Update with new message
                            var updatObj = {
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
                                ReviewId: reviewId,
                                ReviewText: reviewText,
                                IsEditVisible: true,
                                IsDeleteVisible: true,
                                IsReportVisible: true
                            };--%>

                            //self.Reviews.push(updatObj);
                            $('#window').jqxWindow('close');
                        }
                    }
                }
            }
                    
            // Retrieve review data from db
            try {
                $.ajax({
                    url: api + 'reviews/reviews?languageCode=' + languageCode,
                    type: "GET",
                    contentType: "application/json; charset=utf-8",
                    dataType: "json",
                    async: true,
                    success: function (response) {
                        self.Reviews(response);                            
                    },
                    error: function (error) {
                        var err = $.parseJSON(error.responseText);
                        alert(err.ExceptioMessage);
                    },
                });
            }
            catch (ex) {
                alert("An error occurred. Please contact the administrator.");
            }

            ko.bindingHandlers.setRatingWidget = {
                update: function (element, valueAccessor) {
                    // This will be called once when the binding is first applied to an element,
                    // and again whenever any observables/computeds that are accessed change
                    // Update the DOM element based on the supplied values here.
                    $("#" + element.id).jqxRating({ width: 350, height: 35, disabled: true, value: valueAccessor(), theme: 'bootstrap' });
                }
            };
        };
        ko.applyBindings(new ReviewModelObj()); 
    </script>
</asp:Content>