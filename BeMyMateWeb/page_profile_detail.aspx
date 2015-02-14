<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/page_profile.Master" CodeBehind="page_profile_detail.aspx.cs" Inherits="BeMyMateWeb.page_profile" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentSection" runat="server">

    <div class="tab notes active">

        <div id="profileDetailInfos">
            <script id="profileDetailInfosTpl" type="x-tmpl-mustache">
                {{#Areas}}
                <h4> {{AreaName}} </h4>
                <div>
                    <div>
                    {{#QuestionnaireAnswers}}
                        <label>{{QuestionnaireName}}</label>
					    <div>{{AnswerName}}</div>
                    {{/QuestionnaireAnswers}}
                    </div>   
                </div>
                <br />
                {{/Areas}}
            </script>
        </div>

        <div id="canvas-holder" style="width:450px; height:450px; margin-top:40px; margin-left:-90px;">
			    <canvas id="canvas"/>
		</div>

        <%--<div id="container" style="min-width: 400px; max-width: 600px; height: 400px; margin: 0 auto"></div>--%>

        <%--<div id="chart"></div>--%>

	    <%--<form>
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
	    </div>--%>
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
	                        ProfileDetailInfos.DrawChart(response);
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
	        DrawChart: function (response) {	            
	            var areaLabels = [];
	            var areaValues = [];

	            for (var i = 0; i < response.length; i++) {
	                areaLabels.push(response[i].AreaName);
	                areaValues.push(10);
	            }
	            
	            var radarChartData = {
	                labels: areaLabels,
	                datasets: [
                        {
                            label: "My Second dataset",
                            fillColor: "rgba(151,187,205,0.2)",
                            strokeColor: "rgba(151,187,205,1)",
                            pointColor: "rgba(151,187,205,1)",
                            pointStrokeColor: "#fff",
                            pointHighlightFill: "#fff",
                            pointHighlightStroke: "rgba(151,187,205,1)",
                            data: areaValues
                        }
	                ]
	            };

	            new Chart(document.getElementById("canvas").getContext("2d")).Radar(radarChartData, {
	                responsive: true
	            });
	        },
	        Error: function (error) {
	            var err = $.parseJSON(error.responseText);
	            alert(err.ExceptioMessage);
	        }
	    }
	</script>

      <script>
         
    </script>

    <%--<script type="text/javascript">
        $(document).ready(function () {

            $('#container').highcharts({

                chart: {
                    polar: true,
                    type: 'line'
                },

                title: {
                    text: 'Budget vs spending',
                    x: -80
                },

                pane: {
                    size: '80%'
                },

                xAxis: {
                    categories: ['Sales', 'Marketing', 'Development', 'Customer Support',
                            'Information Technology', 'Administration'],
                    tickmarkPlacement: 'on',
                    lineWidth: 0
                },

                yAxis: {
                    gridLineInterpolation: 'polygon',
                    lineWidth: 0,
                    min: 0
                },

                tooltip: {
                    shared: true,
                    pointFormat: '<span style="color:{series.color}">{series.name}: <b>${point.y:,.0f}</b><br/>'
                },

                legend: {
                    align: 'right',
                    verticalAlign: 'top',
                    y: 70,
                    layout: 'vertical'
                },

                series: [{
                    name: 'Allocated Budget',
                    data: [43000, 19000, 60000, 35000, 17000, 10000],
                    pointPlacement: 'on'
                }, {
                    name: 'Actual Spending',
                    data: [50000, 39000, 42000, 31000, 26000, 14000],
                    pointPlacement: 'on'
                }]

            });
        });
		</script>--%>

    <!-- Populate after retrieve data -->
    <script type="text/javascript">
        $(document).ready(function () {
            ProfileDetailInfos.GetDetailInfos();
        });
    </script>

    <%--<!-- Create Radar Chart -->
    <script>
        function createChart() {
            $("#chart").kendoChart({
                title: {
                    text: "Budget report"
                },
                dataSource: {
                    transport: {
                        read: {
                            url: api + 'users/ProfileChartArea?languageCode=' + languageCode,
                            dataType: "json"
                        }
                    }
                },
                seriesDefaults: {
                    type: "radarLine"
                },
                series: [{
                    name: "AreaValue",
                    data: [10, 10, 10, 10, 7]
                }],
                categoryAxis: {
                    categories: ["Area1", "Area2", "Area3", "Area4", "Area5"]
                },
                valueAxis: {
                    labels: {
                        template: "#= value #"
                    }
                }
            });
        }

        $(document).ready(createChart);
        $(document).bind("kendo:skinChange", createChart);
    </script>--%>

</asp:Content>
