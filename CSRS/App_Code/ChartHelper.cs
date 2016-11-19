﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

/// <summary>
/// ChartHelper (Telerik Chart Helper API)
/// API Name    : ChartHelper
/// Create Date : 27-JUN-2015
/// Author      : Rokybul Imrose, Manager - ICT Application Management
/// Description : Telerik Helper API for Bar, Pie, Area and Line Chart
/// </summary>

public class ChartHelper
{
    public enum ChartType
    {
        BarChartVartical = 0,
        BarChartHorizontal = 1,
        PieChart = 2,
        LineChart = 3,
        AreaChart = 4,
        BarChartHorizontalDA = 5
    }
    RadHtmlChart radChart = new RadHtmlChart();


    public ChartHelper(string iD, int iWidth, int iHeight, Telerik.Web.UI.HtmlChart.ChartLegendPosition LegendPosition)
    {
        radChart.ID = iD;
        radChart.Width = Unit.Pixel(iWidth);
        radChart.Height = Unit.Pixel(iHeight);
        radChart.Legend.Appearance.Position = LegendPosition;
       
       // radChart.PlotArea.YAxis.LabelsAppearance.TextStyle.Padding = "10";
       // radChart.PlotArea.XAxis.MinorGridLines.Visible = false;
       // radChart.PlotArea.YAxis.MinorGridLines.Visible = false;
       // radChart.PlotArea.YAxis.Step = 100;

        //radChart.ChartTitle.Appearance.Position = Telerik.Web.UI.HtmlChart.ChartTitlePosition.Top;
        //radChart.ChartTitle.Text = "Process Type Comparison";
    }

    public void CreateChart(Panel BasePanel, ChartType chartType, DataTable dt, string[] ColorName, int yMaxValue = 100, int gridSetps = 20, bool isGroup = false)
    {
        switch (chartType)
        {
            case ChartType.BarChartHorizontal:
                radChart.Skin = "Bootstrap";
                radChart.Layout = Telerik.Web.UI.HtmlChart.ChartLayout.Default;
                radChart.PlotArea.YAxis.MaxValue = yMaxValue;
                                //radChart.PlotArea.XAxis.Step = 30;
                radChart.PlotArea.YAxis.Step = 20;

                BarSeries[] CBS = new BarSeries[dt.Columns.Count - 1];
                for (int i = 0; i < dt.Columns.Count - 1; i++)
                {
                    CBS[i] = new BarSeries();
                    CBS[i].Name = dt.Columns[i + 1].ColumnName;
                    if (isGroup) CBS[i].GroupName = " "; 
                    CBS[i].LabelsAppearance.Visible = true;
                    CBS[i].TooltipsAppearance.Color = System.Drawing.Color.White;
                    CBS[i].LabelsAppearance.Position = Telerik.Web.UI.HtmlChart.BarColumnLabelsPosition.OutsideEnd;

                }

                foreach (DataRow row in dt.Rows)
                {
                    for (int i = 0; i < dt.Columns.Count - 1; i++) CBS[i].SeriesItems.Add(new CategorySeriesItem((decimal)row[i + 1]));
                    radChart.PlotArea.XAxis.Items.Add(row[0].ToString());
                }

                foreach (BarSeries item in CBS) { radChart.PlotArea.Series.Add(item); }
                break;
            case ChartType.BarChartHorizontalDA:
                radChart.Skin = "Bootstrap";
                radChart.Layout = Telerik.Web.UI.HtmlChart.ChartLayout.Default;

                BarSeries[] BS = new BarSeries[dt.Columns.Count - 1];
                for (int i = 0; i < dt.Columns.Count - 1; i++)
                {
                    BS[i] = new BarSeries();
                    BS[i].Name = dt.Columns[i + 1].ColumnName;
                    BS[i].LabelsAppearance.Visible = true;
                    BS[i].TooltipsAppearance.Color = System.Drawing.Color.White;
                    BS[i].LabelsAppearance.Position = Telerik.Web.UI.HtmlChart.BarColumnLabelsPosition.OutsideEnd;
                }

                int j = 0;
                foreach (DataRow row in dt.Rows)
                {
                    for (int i = 0; i < dt.Columns.Count - 1; i++)
                    {
                        BS[i].SeriesItems.Add(new CategorySeriesItem((decimal)row[i + 1], Color.FromName(ColorName[j].ToString())));
                        radChart.PlotArea.XAxis.Items.Add(row[0].ToString());
                    }
                    j++;
                }

                foreach (BarSeries item in BS) { radChart.PlotArea.Series.Add(item); }
                break;
            case ChartType.BarChartVartical:
                radChart.Skin = "Bootstrap";
                radChart.Layout = Telerik.Web.UI.HtmlChart.ChartLayout.Default;
                radChart.PlotArea.YAxis.MaxValue = yMaxValue;
                radChart.PlotArea.XAxis.Step = gridSetps;
                radChart.PlotArea.YAxis.Step = gridSetps;
                 
                radChart.PlotArea.XAxis.LabelsAppearance.RotationAngle = 0;//-45;               

                ColumnSeries[] CCS = new ColumnSeries[dt.Columns.Count - 1];
                for (int i = 0; i < dt.Columns.Count - 1; i++)
                {
                    CCS[i] = new ColumnSeries();
                    CCS[i].Name = dt.Columns[i + 1].ColumnName;
                    if (isGroup) CCS[i].GroupName = " "; 
                    CCS[i].LabelsAppearance.Visible = true;
                    CCS[i].TooltipsAppearance.Color = System.Drawing.Color.White;
                    CCS[i].LabelsAppearance.Position = Telerik.Web.UI.HtmlChart.BarColumnLabelsPosition.OutsideEnd;
                }

                foreach (DataRow row in dt.Rows)
                {
                    for (int i = 0; i < dt.Columns.Count - 1; i++) CCS[i].SeriesItems.Add(new CategorySeriesItem((decimal)row[i + 1]));
                    radChart.PlotArea.XAxis.Items.Add(row[0].ToString());
                }

                foreach (ColumnSeries item in CCS) { radChart.PlotArea.Series.Add(item); }

                break;

            case ChartType.PieChart:
                radChart.Skin = "Silk";//"Bootstrap";
                radChart.Layout = Telerik.Web.UI.HtmlChart.ChartLayout.Default;

                PieSeries PS = new PieSeries();
                PS.Name = "PieSeries1";
                PS.StartAngle = 90;
                PS.LabelsAppearance.Position = Telerik.Web.UI.HtmlChart.PieAndDonutLabelsPosition.Center;
                PS.LabelsAppearance.Visible = true;
                PS.TooltipsAppearance.Color = System.Drawing.Color.White;

                int iX = 0;
                bool IsExploded = true;
                foreach (DataRow row in dt.Rows)
                {
                    PieSeriesItem psi = new PieSeriesItem();
                    psi.Name = row[0].ToString();
                    psi.Y = (decimal)row[1];
                    psi.BackgroundColor = Color.FromName(ColorName[iX].ToString());
                    if (IsExploded) { psi.Exploded = IsExploded; IsExploded = false; }
                    PS.SeriesItems.Add(psi);
                    iX++;
                }

                radChart.PlotArea.Series.Add(PS);
                break;
            case ChartType.LineChart:
                radChart.Skin = "Bootstrap";
                radChart.Layout = Telerik.Web.UI.HtmlChart.ChartLayout.Default;

                LineSeries[] CLS = new LineSeries[dt.Columns.Count - 1];
                for (int i = 0; i < dt.Columns.Count - 1; i++)
                {
                    CLS[i] = new LineSeries();
                    CLS[i].Name = dt.Columns[i + 1].ColumnName;
                    CLS[i].LabelsAppearance.Visible = true;
                    CLS[i].TooltipsAppearance.Color = System.Drawing.Color.White;
                    CLS[i].LabelsAppearance.Position = Telerik.Web.UI.HtmlChart.LineAndScatterLabelsPosition.Above;
                }

                foreach (DataRow row in dt.Rows)
                {
                    for (int i = 0; i < dt.Columns.Count - 1; i++) CLS[i].SeriesItems.Add(new CategorySeriesItem((decimal)row[i + 1]));
                    radChart.PlotArea.XAxis.Items.Add(row[0].ToString());
                }

                foreach (LineSeries item in CLS) radChart.PlotArea.Series.Add(item);
                break;
            case ChartType.AreaChart:
                radChart.Skin = "Bootstrap";
                radChart.Layout = Telerik.Web.UI.HtmlChart.ChartLayout.Default;
                AreaSeries[] CAS = new AreaSeries[dt.Columns.Count - 1];
                for (int i = 0; i < dt.Columns.Count - 1; i++)
                {
                    CAS[i] = new AreaSeries();
                    CAS[i].Name = dt.Columns[i + 1].ColumnName;
                    CAS[i].LabelsAppearance.Visible = false;
                    CAS[i].TooltipsAppearance.Color = System.Drawing.Color.White;
                    CAS[i].Appearance.FillStyle.BackgroundColor = Color.FromName(ColorName[i]);
                }

                foreach (DataRow row in dt.Rows)
                {
                    for (int i = 0; i < dt.Columns.Count - 1; i++) CAS[i].SeriesItems.Add(new CategorySeriesItem((decimal)row[i + 1]));
                    radChart.PlotArea.XAxis.Items.Add(row[0].ToString());
                }
                foreach (AreaSeries item in CAS) radChart.PlotArea.Series.Add(item);
                break;
            default:
                break;
        }
        BasePanel.Controls.Add(radChart);
    }
}