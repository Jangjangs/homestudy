<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>

  <div class="wrap">
	<section class="app-content">
		<div class="row">
			<div class="col-md-6 col-sm-6">
				<div class="widget p-md clearfix">
					<div class="pull-left">
						<h3 class="widget-title">Welcome to Infinity</h3>
						<small class="text-color">Number of views</small>
					</div>
					<span class="pull-right fz-lg fw-500 counter" data-plugin="counterUp">102</span>
				</div><!-- .widget -->
			</div>

			<div class="col-md-6 col-sm-6">
				<div class="widget p-md clearfix">
					<div class="pull-left">
						<h3 class="widget-title">Active</h3>
						<small class="text-color">Loads / contact</small>
					</div>
					<span class="pull-right fz-lg fw-500 counter" data-plugin="counterUp">325</span>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-primary"><span class="counter" data-plugin="counterUp">66.136</span>k</h3>
							<small class="text-color">Total loads</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-paperclip"></i></span>
					</div>
					<footer class="widget-footer bg-primary">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[4,3,5,2,1], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-danger"><span class="counter" data-plugin="counterUp">3.490</span>k</h3>
							<small class="text-color">Total Pending</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-ban"></i></span>
					</div>
					<footer class="widget-footer bg-danger">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[1,2,3,5,4], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-success"><span class="counter" data-plugin="counterUp">8.378</span>k</h3>
							<small class="text-color">Case Close</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-unlock-alt"></i></span>
					</div>
					<footer class="widget-footer bg-success">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[2,4,3,4,3], { type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>

			<div class="col-md-3 col-sm-6">
				<div class="widget stats-widget">
					<div class="widget-body clearfix">
						<div class="pull-left">
							<h3 class="widget-title text-warning"><span class="counter" data-plugin="counterUp">3.490</span>k</h3>
							<small class="text-color">Total Pending</small>
						</div>
						<span class="pull-right big-icon watermark"><i class="fa fa-file-text-o"></i></span>
					</div>
					<footer class="widget-footer bg-warning">
						<small>% charge</small>
						<span class="small-chart pull-right" data-plugin="sparkline" data-options="[5,4,3,5,2],{ type: 'bar', barColor: '#ffffff', barWidth: 5, barSpacing: 2 }"></span>
					</footer>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-12">
				<div class="widget row no-gutter p-lg">						
					<div class="col-md-5 col-sm-5">
						<div>
							<h3 class="widget-title fz-lg text-primary m-b-lg">Sales in 2014</h3>
							<p class="m-b-lg">Collaboratively administrate empowered markets via plug-and-play networks. Dynamically procrastinate B2C users after installed base benefits</p>
							<p class="fs-italic">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Hic eum alias est vitae, obcaecati?</p>
						</div>
					</div>

					<div class="col-md-7 col-sm-7">
						<div>
							<div id="lineChart" data-plugin="plot" data-options="
								[
									{
										data: [[1,3.6],[2,3.5],[3,6],[4,4],[5,4.3],[6,3.5],[7,3.6]],
										color: '#ffa000',
										lines: { show: true, lineWidth: 6 },
										curvedLines: { apply: true }
									},
									{
										data: [[1,3.6],[2,3.5],[3,6],[4,4],[5,4.3],[6,3.5],[7,3.6]],
										color: '#ffa000',
										points: {show: true}
									}
								],
								{
									series: {
										curvedLines: { active: true }
									},
									xaxis: {
										show: true,
										font: { size: 12, lineHeight: 10, style: 'normal', weight: '100',family: 'lato', variant: 'small-caps', color: '#a2a0a0' }
									},
									yaxis: {
										show: true,
										font: { size: 12, lineHeight: 10, style: 'normal', weight: '100',family: 'lato', variant: 'small-caps', color: '#a2a0a0' }
									},
									grid: { color: '#a2a0a0', hoverable: true, margin: 8, labelMargin: 8, borderWidth: 0, backgroundColor: '#fff' },
									tooltip: true,
									tooltipOpts: { content: 'X: %x.0, Y: %y.2',  defaultTheme: false, shifts: { x: 0, y: -40 } },
									legend: { show: false }
								}" style="width: 100%; height: 230px;">
							</div>
						</div>
					</div>
				</div><!-- .widget -->	
			</div>
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-7">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Active Leads</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div class="table-responsive">							
							<table class="table no-cellborder">
								<thead>
									<tr><th>Type</th><th>Lead Name</th><th>Views</th><th>Favorites</th><th>Last Visit</th><th>Last Action</th></tr>
								</thead>
								<tbody>
									<tr><td class="text-primary">Buyer</td><td>Denise Ann</td><td>150</td><td>150</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-primary">Buyer</td><td>Denise Ann</td><td>150</td><td>202</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-success">Landlord</td><td>Denise Ann</td><td>150</td><td>313</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-primary">Buyer</td><td>Denise Ann</td><td>150</td><td>175</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-danger">Seller</td><td>Denise Ann</td><td>150</td><td>148</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-primary">Buyer</td><td>Denise Ann</td><td>150</td><td>1500</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-primary">Buyer</td><td>Denise Ann</td><td>150</td><td>1270</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
									<tr><td class="text-danger">Buyer</td><td>Denise Ann</td><td>150</td><td>3201</td><td>9:23 AM</td><td><span class="table-icon fa fa-envelope"></span> 11/9/2015</td></tr>
								</tbody>
							</table>
						</div>
					</div>
				</div><!-- .widget -->
			</div><!-- END column -->

			<div class="col-md-5">
				<div class="widget todo-widget">
					<header class="widget-header">
						<h4 class="widget-title">Todo List</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body p-b-0">
						<ul class="todo-list">
							<li class="todo-item">
								<div class="checkbox checkbox-default">
									<input type="checkbox" id="checkbox02"/>
									<label for="checkbox02">Record The First Episode Of HTML Tutorial</label>
								</div>
							</li><!-- .todo-item -->

							<li class="todo-item">
								<div class="checkbox checkbox-pink">
									<input type="checkbox" id="checkbox2"/>
									<label for="checkbox2">Prepare The Conference Schedule</label>
								</div>
							</li><!-- .todo-item -->

							<li class="todo-item">
								<div class="checkbox checkbox-warning">
									<input type="checkbox" id="checkbox4" checked/>
									<label for="checkbox4">Decide The Live Discussion Time</label>
								</div>
							</li><!-- .todo-item -->

							<li class="todo-item">
								<div class="checkbox checkbox-success">
									<input type="checkbox" id="checkbox3" checked/>
									<label for="checkbox3">Prepare For The Next Project</label>
								</div>
							</li><!-- .todo-item -->

							<li class="todo-item">
								<div class="checkbox checkbox-danger">
									<input type="checkbox" id="checkbox5" checked/>
									<label for="checkbox5">Finish Up AngularJs Tutorial</label>
								</div>
							</li><!-- .todo-item -->

							<li class="todo-item">
								<div class="checkbox checkbox-purple">
									<input type="checkbox" id="checkbox1" checked/>
									<label for="checkbox1">Finish Infinity Project</label>
								</div>
							</li><!-- .todo-item -->
						</ul><!-- .todo-list -->
					</div>
					<div class="new-todo">
						<input type="text" placeholder="add new task"/>
					</div>
					<footer class="widget-footer">
						<a href="javascript:void(0)" class="btn btn-sm btn-success m-r-md">All</a>
						<a href="javascript:void(0)" class="btn btn-sm btn-default">Archive</a>
						<a href="javascript:void(0)" class="btn btn-sm btn-default pull-right">Clear completed</a>
					</footer>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-6 col-sm-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Activities</h4>
					</header>
					<hr class="widget-separator" />
					<div class="widget-body">
						<div class="streamline">
							<div class="sl-item sl-primary">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>John has just started working on the project</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-danger">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Jane sent you invitation to attend the party</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-success">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Sally added you to her circles</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item sl-warning">
								<div class="sl-content">
									<small class="text-muted">23 mins ago</small>
									<p>Sara has finished her task</p>
								</div>
							</div><!-- .sl-item -->
						</div><!-- .streamline -->
					</div>
				</div><!-- .widget -->
			</div>

			<div class="col-md-6 col-sm-6">
				<div class="widget google-chart">
					<header class="widget-header">
						<h4 class="widget-title">Analytics</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div id="barChart" data-plugin="plot" data-options="
							[
								{
									label: 'Users',
									data: [[1,200],[2,400],[3,500],[4,700],[5,600],[6,400],[7,500],[8,400], [9, 320], [10, 380], [11, 500], [12, 700]],
									bars: {show: true, fill: 1, fillColor: '#3f51b5', align: 'center', barWidth: .4}
								}
							],
							{
								series: {
									bars: {show:  true}
								},
								xaxis: {
									font: {size: 12, lineHeight: 10, style: 'normal', weight: '100',family: 'lato', variant: 'small-caps', color: '#a2a0a0' }
								},
								yaxis: {
									max: 800,
									font: {size: 12, lineHeight: 10, style: 'normal', weight: '100',family: 'lato', variant: 'small-caps', color: '#a2a0a0' }
								},
								legend: { show: false },
								grid: { color: '#fff', labelMargin: 16, hoverable: true },
								colors: ['#3f51b5'],
								tooltip: {
									show: true,
									content: '<div><span>X: %x, Y: %y</span></div>',
									defaultTheme: false
								}
							}" style="width: 100%; height: 220px;">
						</div>
					</div>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-6 col-sm-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Feeds</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div class="media-group feeds-group">

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="/resources/assets/images/217.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">Some of the fantastic things people have had to say about Ooooh</a></h5>
										<small class="text-muted">2 days ago</small>
									</div>
								</div>
							</div><!-- .media-group-item -->

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="/resources/assets/images/218.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">Here are just some of the magazine reviews we have had</a></h5>
										<small class="text-muted">1 day ago</small>
									</div>
								</div>
							</div><!-- .media-group-item -->

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="/resources/assets/images/219.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">Lorem ipsum dolor amet, consectetur adipisicing elit.</a></h5>
										<small class="text-muted">2 days ago</small>
									</div>
								</div>
							</div><!-- .media-group-item -->

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="/resources/assets/images/215.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">“It’s just brilliant. I will recommend it to everyone!”</a></h5>
										<small class="text-muted">2 mins ago</small>
									</div>
								</div>
							</div><!-- .media-group-item -->

							<div class="media-group-item">
								<div class="media">
									<div class="media-left">
										<div class="avatar avatar-sm avatar-circle">
											<img src="/resources/assets/images/221.jpg" alt="">
										</div>
									</div>
									<div class="media-body">
										<h5><a href="javascript:void(0)" class="text-color">John has just started working on the project</a></h5>
										<small class="text-muted">right now</small>
									</div>
								</div>
							</div><!-- .media-group-item -->
						</div>
					</div>
				</div><!-- .widget -->
			</div>

			<div class="col-md-6 col-sm-6">
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">Streams</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body">
						<div class="streamline m-l-lg">
							<div class="sl-item p-b-md">
								<div class="sl-avatar avatar avatar-sm avatar-circle">
									<img class="img-responsive" src="/resources/assets/images/221.jpg" alt="avatar"/>
								</div><!-- .avatar -->
								<div class="sl-content m-l-xl">
									<h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">John Doe</a><small class="text-muted fz-sm">last month</small></h5>
									<p>John has just started working on the project</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item p-b-md">
								<div class="sl-avatar avatar avatar-sm avatar-circle">
									<img class="img-responsive" src="/resources/assets/images/214.jpg" alt="avatar"/>
								</div><!-- .avatar -->
								<div class="sl-content m-l-xl">
									<h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Jane Doe</a><small class="text-muted fz-sm">last month</small></h5>
									<p>Jane sent you invitation to attend the party</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item p-b-md">
								<div class="sl-avatar avatar avatar-sm avatar-circle">
									<img class="img-responsive" src="/resources/assets/images/217.jpg" alt="avatar"/>
								</div><!-- .avatar -->
								<div class="sl-content m-l-xl">
									<h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Sally Mala</a><small class="text-muted fz-sm">last month</small></h5>
									<p>Sally added you to her circles</p>
								</div>
							</div><!-- .sl-item -->

							<div class="sl-item p-b-md">
								<div class="sl-avatar avatar avatar-sm avatar-circle">
									<img class="img-responsive" src="/resources/assets/images/211.jpg" alt="avatar"/>
								</div><!-- .avatar -->
								<div class="sl-content m-l-xl">
									<h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Sara Adams</a><small class="text-muted fz-sm">last month</small></h5>
									<p>Sara has finished her task</p>
								</div>
							</div><!-- .sl-item -->
							<div class="sl-item p-b-md">
								<div class="sl-avatar avatar avatar-sm avatar-circle">
									<img class="img-responsive" src="/resources/assets/images/214.jpg" alt="avatar"/>
								</div><!-- .avatar -->
								<div class="sl-content m-l-xl">
									<h5 class="m-t-0"><a href="javascript:void(0)" class="m-r-xs theme-color">Sandy Doe</a><small class="text-muted fz-sm">last month</small></h5>
									<p>Sara has finished her task</p>
								</div>
							</div><!-- .sl-item -->
						</div><!-- .streamline -->
					</div>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->

		<div class="row">
			<div class="col-md-12">
				<div class="widget widget-pie-chart">
					<header class="widget-header">
						<h4 class="widget-title">ACTIVITIES</h4>
					</header>
					<hr class="widget-separator"/>
					<div class="widget-body clearfix">
						<div data-plugin="chart" data-options="{
		              tooltip : {
		                  trigger: 'axis'
		              },
		              legend: {
		                  data:['Max','Min']
		              },
		              calculable : true,
		              xAxis : [
		                  {
		                      type : 'category',
		                      boundaryGap : false,
		                      data : ['Mon','Tue','Wed','Thu','Fri','Sat','Sun']
		                  }
		              ],
		              yAxis : [
		                  {
		                      type : 'value',
		                      axisLabel : {
		                          formatter: '{value} °C'
		                      }
		                  }
		              ],
		              series : [
		                  {
		                      name:'Max',
		                      type:'line',
		                      data:[9, 9, 13, 11, 10, 11, 8],
		                      markPoint : {
		                          data : [
		                              {type : 'max', name: 'Max'},
		                              {type : 'min', name: 'Min'}
		                          ]
		                      },
		                      markLine : {
		                          data : [
		                              {type : 'average', name: 'Average'}
		                          ]
		                      }
		                  },
		                  {
		                      name:'Min',
		                      type:'line',
		                      data:[1, -3, 2, 5, 3, 4, 0],
		                      markPoint : {
		                          data : [
		                              {name : 'Min of Week', value : -3, xAxis: 1, yAxis: -1.5}
		                          ]
		                      },
		                      markLine : {
		                          data : [
		                              {type : 'average', name : 'Average'}
		                          ]
		                      }
		                  }
		              ]
		            }" style="height: 300px;">
					</div>
				</div><!-- .widget -->
			</div>
		</div><!-- .row -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->
 <%@ include file="includes/footer.jsp" %>