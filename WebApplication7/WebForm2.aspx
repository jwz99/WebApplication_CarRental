<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication7.WebForm2" MasterPageFile="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

        <div>
        </div>
        Samochody, którymi dysponuje wypożyczalnia<br />
        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem value =" 0">Sortuj według</asp:ListItem>
            <asp:ListItem>Cena od najniższej</asp:ListItem>
            <asp:ListItem>Cena od najwyższej</asp:ListItem>
            <asp:ListItem>Rok produkcji rosnąco</asp:ListItem>
            <asp:ListItem>Rok produkcji malejąco</asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idsamochodu" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="idsamochodu" HeaderText="idsamochodu" ReadOnly="True" SortExpression="idsamochodu" />
                <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" />
                <asp:BoundField DataField="rokProdukcji" HeaderText="rokProdukcji" SortExpression="rokProdukcji" />
                <asp:BoundField DataField="krajPochodzenia" HeaderText="krajPochodzenia" SortExpression="krajPochodzenia" />
                <asp:BoundField DataField="nrRejestracyjny" HeaderText="nrRejestracyjny" SortExpression="nrRejestracyjny" />
                <asp:BoundField DataField="stanPojazdu" HeaderText="stanPojazdu" SortExpression="stanPojazdu" />
                <asp:BoundField DataField="stawka dzienna" HeaderText="stawka dzienna" SortExpression="stawka dzienna" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="if(@parametr = 1)
select * from samochody order by samochody.[stawka dzienna]
if(@parametr = 2)
select * from samochody order by samochody.[stawka dzienna] desc
if(@parametr = 3)
select * from samochody order by samochody.rokProdukcji
if(@parametr = 4)
select * from samochody order by samochody.rokProdukcji desc">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="parametr" PropertyName="SelectedIndex" />
            </SelectParameters>
        </asp:SqlDataSource>
        Samochody wybranej marki<br />
<asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList2_SelectedIndexChanged">
    <asp:ListItem>Audi</asp:ListItem>
    <asp:ListItem>BMW</asp:ListItem>
    <asp:ListItem>Opel</asp:ListItem>
    <asp:ListItem>Mini</asp:ListItem>
    <asp:ListItem>Peugeot</asp:ListItem>
</asp:DropDownList>
<br />
<asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="idsamochodu" DataSourceID="SqlDataSource3">
    <Columns>
        <asp:BoundField DataField="idsamochodu" HeaderText="idsamochodu" ReadOnly="True" SortExpression="idsamochodu" />
        <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" />
        <asp:BoundField DataField="rokProdukcji" HeaderText="rokProdukcji" SortExpression="rokProdukcji" />
        <asp:BoundField DataField="krajPochodzenia" HeaderText="krajPochodzenia" SortExpression="krajPochodzenia" />
        <asp:BoundField DataField="nrRejestracyjny" HeaderText="nrRejestracyjny" SortExpression="nrRejestracyjny" />
        <asp:BoundField DataField="stanPojazdu" HeaderText="stanPojazdu" SortExpression="stanPojazdu" />
        <asp:BoundField DataField="stawka dzienna" HeaderText="stawka dzienna" SortExpression="stawka dzienna" />
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="SELECT * FROM [samochody] where marka like @parametr +'%'">
    <SelectParameters>
        <asp:ControlParameter ControlID="DropDownList2" Name="parametr" PropertyName="Text" />
    </SelectParameters>
</asp:SqlDataSource>
        <br />
         
    </asp:Content>
