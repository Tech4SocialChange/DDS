<%@ Page Title="" Language="C#" MasterPageFile="~/CSRSMASTER.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CSRS.Default" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script src="http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.js"
        type="text/javascript"></script>

    <style type="text/css">
        @import url("http://www.google.com/uds/solutions/dynamicfeed/gfdynamicfeedcontrol.css");

        #feedControl {
            margin-top: 10px;
            margin-left: auto;
            margin-right: auto;
            /*width: 440px;*/
            height: 320px;
            font-size: 12px;
            color: #9CADD0;
        }

        .gfg-root {
            height: 300px;
        }

        .bar {
            fill: steelblue;
        }

            .bar:hover {
                fill: brown;
            }

        .axis--x path {
            display: none;
        }
    </style>
    <script type="text/javascript">
        function load() {
            var feed = "http://feeds.bbci.co.uk/news/world/rss.xml";
            new GFdynamicFeedControl(feed, "feedControl");

        }
        google.load("feeds", "1");
        google.setOnLoadCallback(load);
    </script>
    <link href="css/styles.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="formBase">
        <div class="formTitlePic">
            <div class="formTitlePicTitle">DASHBOARD</div>
        </div>

        <div class="formContent">
            <%-- <div class="row">
                <div class="col-md-12" style="margin-bottom: 20px;">
                    <div style="height: 50px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 15px; font-weight:bold">
                        <a style="float: left; width:33%" href="Resources/csp.pdf" target="_blank">CHILD SAFEGUARD POLICY</a>
                        <a style="float: left; width:33%; text-align:center" href="Resources/csp.pdf" target="_blank">RESOURCES</a>
                        <a style="float: right; width:33%; text-align:right" href="Resources/csp.pdf" target="_blank">FAQ</a>
                    </div>
                </div>
            </div>--%>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-lg-6">
                    <%--<div style="height: 150px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 5px; margin-bottom: 20px;">
                      <%--  <div id="body1">
                            <div id="feedControl1">Loading...</div>
                        </div>-

                    </div>--%>
                    <div style="height: 320px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 5px;">
                        <div id="body">
                            <div id="feedControl">Loading...</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-6" style="margin-bottom: 20px;">
                    <div style="height: 320px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 5px;">

                        <div class="backElement">

                            <telerik:RadRotator RenderMode="Lightweight" ID="RadRotator1" Skin="Silk" RotatorType="AutomaticAdvance" ScrollDirection="Up"
                                ScrollDuration="2000" runat="server" Width="100%"
                                ItemWidth="410" Height="290" ItemHeight="64" FrameDuration="1" InitialItemIndex="-1"
                                CssClass="rotator">
                                <ItemTemplate>
                                    <div class="itemTemplate" style="background-image: url('images/<%# this.GetDayOfWeek(XPath("be:published", NamespaceManager).ToString()) %>.png');">
                                        <div class="dateTime">
                                            <div class="time">
                                                <%# (this.GetTimeOnly(XPath("be:published", NamespaceManager).ToString())) %>
                                            </div>
                                            <div class="date">
                                                <%# (this.GetDateOnly(XPath("be:published", NamespaceManager).ToString()))%>
                                            </div>
                                        </div>
                                        <div class="title">
                                            <span>
                                                <%# System.Web.HttpUtility.HtmlEncode(XPath("be:title", NamespaceManager).ToString())%>
                                            </span>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </telerik:RadRotator>
                            <asp:Label ID="lblMessage" Visible="false" CssClass="message" runat="server" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6" style="margin-bottom: 20px;">
                    <div style="height: 325px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 5px;">
                        <div style="text-align: center; font-weight: 700">DIVISION WISE PEOPLE EFFECTED BY CYCLONE 2010 (THOUSAND)</div>
                        <div style="margin-top: -20px; margin-left: -15px;">
                            <asp:Panel ID="Chart1" runat="server"></asp:Panel> 
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div style="height: 325px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 5px;">
                        <div style="text-align: center; font-weight: 700">USER MESSAGE FROM MOBILE APP</div>
                        <%--<div style="margin-top: -20px; margin-left: -15px;">
                            <asp:Panel ID="Chart2" runat="server"></asp:Panel>
                        </div>--%>
                        <div style="overflow: scroll; margin: 0; padding: 0; width: 100%; height: 290px;">
                            <telerik:RadGrid ID="RadGrid2" runat="server" AutoGenerateColumns="False" Width="100%" Skin="Silk">
                                <MasterTableView>
                                    <Columns>
                                        <telerik:GridBoundColumn DataField="TextMessage" FilterControlAltText="Filter column column" HeaderText="Message(s)" UniqueName="column">
                                            <ColumnValidationSettings>
                                                <ModelErrorMessage Text="" />
                                            </ColumnValidationSettings>
                                        </telerik:GridBoundColumn>
                                    </Columns>
                                </MasterTableView>
                            </telerik:RadGrid>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row" style="margin-bottom: 20px;">
                <div class="col-md-6">
                    <div style="height: 300px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 5px;">
                        <div style="text-align: center; font-weight: 700">PEOPLE EFFECTED BY FLOOD IN LAST 5 YEARS</div>
                        <div style="margin-top: -5px; margin-left: 5px;">
                            <%--<asp:Panel ID="Chart5" runat="server"></asp:Panel>--%>
                            <svg width="435" height="270"></svg>
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div style="height: 300px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 5px;">
                        <div style="text-align: center; font-weight: 700">PEOPLE EFFECTED BY FIRE IN LAST 5 YEARS</div>
                        <div style="margin-top: -5px; margin-left: 5px;">
                            <asp:Panel ID="Chart6" runat="server"></asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
            <div>
                <style>
                    #map-canvas {
                        margin: 0;
                        padding: 0;
                        min-height: 420px;
                        max-height: 480px;
                        height: 100%;
                        width: 100%;
                    }
                </style>

                <script>
                    var map;
                    function initialize() {

                        var neighborhoods = [
                        { lat: 23.791595, lng: 90.4114458, title: 'Save the Children' },
                        { lat: 23.7737694, lng: 90.4003706, title: 'Disaster Point # 01' },
                        { lat: 23.7799436, lng: 90.4080028, title: 'Disaster Point # 02' },
                        { lat: 23.7123602, lng: 90.4314709, title: 'Disaster Point # 03' },
                        { lat: 23.8096034, lng: 90.3589004, title: 'Disaster Point # 04' },
                        { lat: 23.7596034, lng: 90.3389004, title: 'Disaster Point # 05' },
                        { lat: 23.7696034, lng: 90.3349004, title: 'Disaster Point # 06' },
                        { lat: 23.7196034, lng: 90.3289004, title: 'Disaster Point # 07' },
                        { lat: 23.7296034, lng: 90.3309004, title: 'Disaster Point # 08' },
                        { lat: 23.7496034, lng: 90.3409004, title: 'Disaster Point # 09' }
                        ];
                        var mdiv = document.getElementById('map-canvas');
                        var mapOption = {
                            zoom: 11,
                            center: new google.maps.LatLng(23.7637694, 90.4003706),

                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                            styles: [{ elementType: 'geometry', stylers: [{ color: '#ebe3cd' }] },
                                        { elementType: 'labels.text.fill', stylers: [{ color: '#523735' }] },
                                                { elementType: 'labels.text.stroke', stylers: [{ color: '#f5f1e6' }] },
                                                    { featureType: 'administrative', elementType: 'geometry.stroke', stylers: [{ color: '#c9b2a6' }] },
                                                    { featureType: 'administrative.land_parcel', elementType: 'geometry.stroke', stylers: [{ color: '#dcd2be' }] },
                                                    { featureType: 'administrative.land_parcel', elementType: 'labels.text.fill', stylers: [{ color: '#ae9e90' }] },
                                                    { featureType: 'landscape.natural', elementType: 'geometry', stylers: [{ color: '#dfd2ae' }] },
                                                    { featureType: 'poi', elementType: 'geometry', stylers: [{ color: '#dfd2ae' }] },
                                                    { featureType: 'poi', elementType: 'labels.text.fill', stylers: [{ color: '#93817c' }] },
                                                    { featureType: 'poi.park', elementType: 'geometry.fill', stylers: [{ color: '#a5b076' }] },
                                                    { featureType: 'poi.park', elementType: 'labels.text.fill', stylers: [{ color: '#447530' }] },
                                                    { featureType: 'road', elementType: 'geometry', stylers: [{ color: '#f5f1e6' }] },
                                                    { featureType: 'road.arterial', elementType: 'geometry', stylers: [{ color: '#fdfcf8' }] },
                                                    { featureType: 'road.highway', elementType: 'geometry', stylers: [{ color: '#f8c967' }] },
                                                    { featureType: 'road.highway', elementType: 'geometry.stroke', stylers: [{ color: '#e9bc62' }] },
                                                    { featureType: 'road.highway.controlled_access', elementType: 'geometry', stylers: [{ color: '#e98d58' }] },
                                                    { featureType: 'road.highway.controlled_access', elementType: 'geometry.stroke', stylers: [{ color: '#db8555' }] },
                                                    { featureType: 'road.local', elementType: 'labels.text.fill', stylers: [{ color: '#806b63' }] },
                                                    { featureType: 'transit.line', elementType: 'geometry', stylers: [{ color: '#dfd2ae' }] },
                                                    { featureType: 'transit.line', elementType: 'labels.text.fill', stylers: [{ color: '#8f7d77' }] },
                                                    { featureType: 'transit.line', elementType: 'labels.text.stroke', stylers: [{ color: '#ebe3cd' }] },
                                                    { featureType: 'transit.station', elementType: 'geometry', stylers: [{ color: '#dfd2ae' }] },
                                                    { featureType: 'water', elementType: 'geometry.fill', stylers: [{ color: '#b9d3c2' }] },
                                                    { featureType: 'water', elementType: 'labels.text.fill', stylers: [{ color: '#92998d' }] }],

                            hiding: [{ featureType: 'poi.business', stylers: [{ visibility: 'off' }] }, { featureType: 'transit', elementType: 'labels.icon', stylers: [{ visibility: 'off' }] }]
                        };
                        map = new google.maps.Map(mdiv, mapOption);
                        var myLatlng = new google.maps.LatLng(23.791595, 90.4114458);
                        var image = '../images/pointer.png';
                        for (var i = 0; i < neighborhoods.length; i++) {
                            var beachMarker = new google.maps.Marker({
                                position: neighborhoods[i],
                                map: map,
                                icon: image,
                                title: neighborhoods[i].title,
                                draggable: false,
                                animation: google.maps.Animation.DROP
                            });
                        }

                        google.maps.event.addDomListener(window, 'load', initialize);
                    }

                </script>
                <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDNmUWulUV31VdXe2c5IU30d8D4Q6pzMYw&callback=initialize"></script>

                <div class="col-md-12" style="margin: 0; padding: 0;">
                    <div style="height: 420px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); padding: 1px;padding-bottom:4px;">
                        <div id="map-canvas" style="margin-left: 0; padding-left: 0; margin-right: 0; padding-right: 0;">
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row" style="margin: 0px; padding: 0px;">
             
            <div class="col-md-4" style="margin: 0; padding: 0;">
                <div style="height: 40px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); vertical-align: top; padding: 10px 10px  0px 10px; margin: 5px 10px  10px 28px;">
                    <span>
                        <img src="Images/FireServiceIcon.png" /></span> <strong>Fire Service:</strong>  12223
                </div>
            </div>
            <div class="col-md-4" style="margin: 0; padding: 0;">
                <div style="height: 40px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); vertical-align: top; padding: 10px 10px  0px 10px; margin: 5px 10px  10px 10px;">
                    <span>
                        <img src="Images/PoliceIcon.png" /></span><strong>&nbsp;Police Helpline:</strong> 12221
                </div>
            </div>
            <div class="col-md-4" style="margin: 0; padding: 0;">
                <div style="height: 40px; box-shadow: 0 0 2px rgba(0,0,0,0.12),0 2px 4px rgba(0,0,0,0.12); vertical-align: top; padding: 10px 10px  0px 10px; margin: 5px 28px  10px 10px;">
                    <span>
                        <img src="Images/am.png" /></span><strong>&nbsp;Ambulance:</strong> 12224
                </div>
            </div>
                 
        </div>
    </div>


    <script src="https://d3js.org/d3.v4.min.js"></script>
    <script>
        var svg = d3.select("svg"),
            margin = { top: 20, right: 20, bottom: 30, left: 40 },
            width = +svg.attr("width") - margin.left - margin.right,
            height = +svg.attr("height") - margin.top - margin.bottom;

        var x = d3.scaleBand().rangeRound([0, width]).padding(0.1),
            y = d3.scaleLinear().rangeRound([height, 0]);

        var g = svg.append("g")
            .attr("transform", "translate(" + margin.left + "," + margin.top + ")");

        d3.tsv("data.tsv", function (d) {
            d.frequency = +d.frequency;
            return d;
        }, function (error, data) {
            if (error) throw error;

            x.domain(data.map(function (d) { return d.letter; }));
            y.domain([0, d3.max(data, function (d) { return d.frequency; })]);

            g.append("g")
                .attr("class", "axis axis--x")
                .attr("transform", "translate(0," + height + ")")
                .call(d3.axisBottom(x));

            g.append("g")
                .attr("class", "axis axis--y")
                .call(d3.axisLeft(y).ticks(10, "%"))
              .append("text")
                .attr("transform", "rotate(-90)")
                .attr("y", 6)
                .attr("dy", "0.71em")
                .attr("text-anchor", "end")
                .text("Frequency");

            g.selectAll(".bar")
              .data(data)
              .enter().append("rect")
                .attr("class", "bar")
                .attr("x", function (d) { return x(d.letter); })
                .attr("y", function (d) { return y(d.frequency); })
                .attr("width", x.bandwidth())
                .attr("height", function (d) { return height - y(d.frequency); });
        });

    </script>
</asp:Content>

