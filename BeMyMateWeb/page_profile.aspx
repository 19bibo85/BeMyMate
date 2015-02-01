﻿<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/page_dashboard.Master" CodeBehind="page_profile.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">
      
	<div class="menubar">
		<div class="sidebar-toggler visible-xs">
			<i class="ion-navicon"></i>
		</div>
				
		<div class="page-title">
			John Stewart Profile
			<small class="hidden-xs" style="font-weight:600;">All tabs have content</small>
		</div>
		<a href="#" class="pull-right btn btn-primary">Edit user</a>
	</div>

	<div class="content-wrapper clearfix">
		<div id="profileBasic" class="profile-info">

            <!-- Profile Basic Info template -->
            <script id="profileBasicTpl" type="x-tmpl-mustache">
                {{#Profile}}
			    <div class="avatar">
				    <img src="{{AvatarName}}" />
				    <div class="name">{{UserFullName}}</div>
				    <div class="position">{{UserType}}</div>
				    <div class="social">
					    <a href="#"><i class="fa fa-facebook"></i></a>
					    <a href="#"><i class="fa fa-twitter"></i></a>
				    </div>
			    </div>
			    <div class="details">
                    <div class="field">
                        <label>Email</label>
					    <div class="value">{{EmailName}}</div>
				    </div>                
				    <div class="field">
                        {{#Phones}}
					    <label>Phone</label>
					    <div class="value">{{Name}}</div>
					    <div class="sub">{{Type}}</div>
                        {{/Phones}}
				    </div>
				    <div class="field">
                        {{#Addresses}}
					    <label>Address</label>
					    <div class="value">{{Name}}</div>
                        <div class="sub">{{Type}}</div>
                        {{/Addresses}}
				    </div>
                    <div class="field">
                        {{#Jobs}}
					    <label>Jobs</label>
					    <div class="value">{{Name}}</div>
                        {{/Jobs}}
				    </div>
				    <div class="field">
					    <label>Gender</label>
					    <div class="value"> {{Gender}} </div>
				    </div>
			    </div>
                {{/Profile}}
            </script>
		</div>

		<div class="profile-content">
			<div class="tabs">
				<ul>
					<li>
						<a href="#" class="active">Activity Notes</a>
					</li>
					<li>
						<a href="#">Orders</a>
					</li>
					<li>
						<a href="#">Work</a>
					</li>
				</ul>
			</div>

			<div class="tab-content">
				<div class="tab notes active">
					<form>
						<div class="editor clearfix">
							<textarea class="form-control" rows="4" placeholder="Enter a new note..."></textarea>

							<div class="options clearfix">
								<button class="button" type="submit">
									<span>Submit note</span>
								</button>
								<div class="attach">
									<a href="#" data-toggle="tooltip" title="Add location">
										<i class="ion-location"></i>
									</a>
									<a href="#" data-toggle="tooltip" title="Add files">
										<i class="ion-paperclip"></i>
									</a>
									<a href="#" data-toggle="tooltip" title="Add a photo">
										<i class="ion-camera"></i>
									</a>
								</div>
							</div>
						</div>
					</form>

					<div class="filter clearfix">
						<h4 class="pull-left">Recent Notes</h4>

						<form class="pull-right">
							<select data-smart-select>
								<option>Sort by...</option>
								<option>Date</option>
								<option>User</option>
								<option>Attachments</option>
							</select>
						</form>
					</div>

					<div class="comments">
						<div class="row comment">
							<div class="col-sm-2">
								<img src="images/avatars/7.jpg" class="avatar img-responsive" />
							</div>
							<div class="col-sm-10">
								<div class="message clearfix">
									<header>
										<span class="name">John Arnold</span>
										<span class="date pull-right">2h ago</span>
									</header>
									<div class="note">
										<p>
											I love making the stuff, that’s sort of the core of it. I love creating the stuff. It’s so satisfying to get from the beginning to the end, from a shaky nothing idea to something that’s well formed and the audience really likes.
										</p>
										<p>
											You have to roll up your sleeves and be a stonecutter before you can become a sculptor – command of craft always precedes art: apprentice, journeyman, master. 
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row comment">
							<div class="col-sm-2">
								<img src="images/avatars/5.jpg" class="avatar img-responsive" />
							</div>
							<div class="col-sm-10">
								<div class="message clearfix">
									<header>
										<span class="name">Jamie Lannister</span>
										<span class="date pull-right">6h ago</span>
									</header>
									<div class="note">
										<p>
											Functionality is so over-valued in design, and we’ve kept design very small in that way. Functionality is the sheer minimum. If your house burns down, what do you take? The cat in the window that you got from your mother, or the chair you have?
										</p>
										<div class="files clearfix">
											<div class="file">
												<img class="img-responsive" src="images/shots/4.png" />

												<span class="name">
													Some cool file name
												</span>
											</div>
											<div class="file">
												<img class="img-responsive" src="images/shots/5.png" />

												<span class="name">
													Website design screenshot
												</span>
											</div>
											<div class="file">
												<img class="img-responsive" src="images/shots/6.jpg" />

												<span class="name">
													New Dashboard panel
												</span>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="row comment">
							<div class="col-sm-2">
								<img src="images/avatars/4.jpg" class="avatar img-responsive" />
							</div>
							<div class="col-sm-10">
								<div class="message clearfix">
									<header>
										<span class="name">Karen Stark</span>
										<span class="date pull-right">1 day ago</span>
									</header>
									<div class="note">
										<p>
											You have to roll up your sleeves and be a stonecutter before you can become a sculptor – command of craft always precedes art: apprentice, journeyman, master. 
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="row comment">
							<div class="col-sm-2">
								<img src="images/avatars/15.jpg" class="avatar img-responsive" />
							</div>
							<div class="col-sm-10">
								<div class="message clearfix">
									<header>
										<span class="name">John Williams</span>
										<span class="date pull-right">3 days ago</span>
									</header>
									<div class="note">
										<p>
											I love making the stuff, that’s sort of the core of it. I love creating the stuff. It’s so satisfying to get from the beginning to the end, from a shaky nothing idea to something that’s well formed and the audience really likes. 
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="load-more">
						<a href="#" class="btn btn-default">Load more comments</a>
					</div>
				</div>
				<div class="tab orders">
					<table id="datatable-example">
			            <thead>
			                <tr>
			                    <th tabindex="0" rowspan="1" colspan="1">Order
			                    </th>
			                    <th tabindex="0" rowspan="1" colspan="1">Date
			                    </th>
			                    <th tabindex="0" rowspan="1" colspan="1">Status
			                    </th>
			                    <th tabindex="0" rowspan="1" colspan="1">Total
			                    </th>
			                </tr>
			            </thead>
			            <tbody>
			                <tr>
			                    <td>
			                        <a href="#">#1445</a>
			                    </td>
			                    <td>
			                        Mar 11, 11:50am

			                        <i class="ion-alert-circled" data-toggle="tooltip" title="This order is urgent to ship">
			                        </i>
			                    </td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$399.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#1897</a>
			                    </td>
			                    <td>Mar 10, 06:50am</td>
			                    <td><span class="label label-warning">Pending</span></td>
			                    <td>$699.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#1089</a>
			                    </td>
			                    <td>Mar 08, 01:43pm</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$1,879.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#1883</a>
			                    </td>
			                    <td>Mar 07, 07:30pm</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$279.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#2288</a>
			                    </td>
			                    <td>Mar 04, 04:30pm</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$399.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#3978</a>
			                    </td>
			                    <td>Mar 11, 11:50am</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$399.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#6876</a>
			                    </td>
			                    <td>Mar 04, 04:30pm</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$399.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#3445</a>
			                    </td>
			                    <td>Mar 11, 11:50am</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$399.99</td>
			                </tr>
			                <tr>
			                    <td>
			                        <a href="#">#3445</a>
			                    </td>
			                    <td>Mar 11, 11:50am</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$399.99</td>
			                </tr>
							<tr>
			                    <td>
			                        <a href="#">#3445</a>
			                    </td>
			                    <td>Mar 11, 11:50am</td>
			                    <td><span class="label label-default">Paid</span></td>
			                    <td>$399.99</td>
			                </tr>
			            </tbody>
			        </table>
				</div>
				<div class="tab work">
					<div class="row">
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/1.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/2.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/3.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/4.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/5.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/6.jpg" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/7.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/8.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/9.png" />
							</div>
						</div>
						<div class="col-sm-4">
							<div class="pic">
								<div class="mask">
									<div class="title">My Finder</div>
									<div class="description">
										I was working on it a little too while ago
										and thought I tink this is getting pretty good.
									</div>
									<div class="date">
										08 Feb, 2014
									</div>
								</div>
								<img class="img-responsive" src="images/shots/10.png" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

    <!-- Get Configuration data-->
    <script type="text/javascript">
        var api = "<%= ConfigurationManager.AppSettings["ApiPath"] %>";
        var languageCode = "<%= ConfigurationManager.AppSettings["LanguageCode"] %>";
    </script>

    <!-- POPULATE -->
    <!-- Populate Basic Info Data -->
	<script type="text/javascript">
	    //var AvatarMenu = {
	    //    ServiceAPI: api,
	    //    GetMenus: function () {
	    //        try {
	    //            $.ajax({
	    //                url: this.ServiceAPI + 'users/UserMenus?sectionId=' + avatarSectionId + '&languageCode=' + languageCode,
	    //                type: "GET",
	    //                contentType: "application/json; charset=utf-8",
	    //                dataType: "json",
	    //                async: true,
	    //                success: function (response) { AvatarMenu.Success(response) },
	    //                error: function (error) { AvatarMenu.Error(error); },
	    //            });
	    //        }
	    //        catch (ex) {
	    //            alert("An error occurred. Please contact the administrator.");
	    //        }
	    //    },
	    //    Success: function (response) {
	    //        var avatarTpl = $('#avatarTpl').html();
	    //        Mustache.parse(avatarTpl);   // optional, speeds up future uses
	    //        var rendered = Mustache.render(avatarTpl, { Avatar: $.parseJSON(response) });
	    //        $('#avatarMenu').html(rendered);
	    //    },
	    //    Error: function (error) {
	    //        var err = $.parseJSON(error.responseText);
	    //        alert(err.ExceptioMessage);
	    //    }
	    //}

	    var profileBasicTpl = $('#profileBasicTpl').html();
	    Mustache.parse(profileBasicTpl);   // optional, speeds up future uses

	    var data = {
	        Profile: [
                    {
                        AvatarName: "placeholder.png",
                        UserFullName: "Alberto Tosi Brandi",
                        UserType: "Tennant",
                        EmailName: "alberto.tosibrandi@gmail.com",
                        Phones:
                            {
                                Name: "0894727242",
                                Type: "Home"
                            },
                        Phones:
                            {
                                Name: "0894727242",
                                Type: "Home"
                            },
                        Addresses:
                            {
                                Name: "71, Christchurch View, Dublin 8, Dublin",
                                Type: "Home"
                            },
                        Jobs:
                            {
                                Name: "Software Developer"
                            },
                        Gender: "Male",
                    }]
	            };

	    var rendered = Mustache.render(profileBasicTpl, data);
	    $('#profileBasic').html(rendered);
	</script>

</asp:Content>
