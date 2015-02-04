<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/page_profile.Master" CodeBehind="page_profile_detail.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">

    <div class="tab notes active">

	<form>
		<div class="editor clearfix">
			<textarea class="form-control" rows="4" placeholder="Enter a new note..."></textarea>

			<div class="options clearfix">
				<button class="button" type="submit">
					<span>Submit note</span>
				</button>
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

    <%--<div class="tab orders">
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
</div>--%>

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

</asp:Content>