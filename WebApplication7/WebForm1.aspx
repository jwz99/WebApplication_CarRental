<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication7.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <p>
        Wybierz termin wypożyczenia<asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
        Wybierz termin zwrotu<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click2" Text="Szukaj" />
    </p>
<p>
        Dostępne samochody</p>
    <p>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1" DataKeyNames="idsamochodu">
            <Columns>
                <asp:BoundField DataField="idsamochodu" HeaderText="idsamochodu" ReadOnly="True" SortExpression="idsamochodu" />
                <asp:BoundField DataField="marka" HeaderText="marka" SortExpression="marka" />
                <asp:BoundField DataField="stawka dzienna" HeaderText="stawka dzienna" SortExpression="stawka dzienna" />
                <asp:BoundField DataField="rokProdukcji" HeaderText="rokProdukcji" SortExpression="rokProdukcji" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="select samochody.idsamochodu, samochody.marka, samochody.[stawka dzienna], samochody.rokProdukcji from samochody where samochody.idsamochodu in (select distinct samochody.idsamochodu from samochody except (
select rezerwacje.idsamochodu from rezerwacje where (rezerwacje.dataWypozyczenia between @parametr1 and @parametr2 or  rezerwacje.dataZwrotu between @parametr1 and @parametr2 or @parametr1 between rezerwacje.dataWypozyczenia and rezerwacje.dataZwrotu or @parametr2 between rezerwacje.dataWypozyczenia and rezerwacje.dataZwrotu)))

">
            <SelectParameters>
                <asp:ControlParameter ControlID="TextBox1" Name="parametr1" PropertyName="Text" />
                <asp:ControlParameter ControlID="TextBox2" Name="parametr2" PropertyName="Text" />
            </SelectParameters>
        </asp:SqlDataSource>
    </p>
    <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="idsamochodu" DataValueField="idsamochodu" Width="148px">
    </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="select distinct samochody.idsamochodu from samochody except (
select rezerwacje.idsamochodu from rezerwacje where rezerwacje.idsamochodu in (select rezerwacje.idsamochodu from rezerwacje where (rezerwacje.dataWypozyczenia between @parametr1 and @parametr2 or  rezerwacje.dataZwrotu between @parametr1 and @parametr2 or @parametr1 between rezerwacje.dataWypozyczenia and rezerwacje.dataZwrotu or @parametr2 between rezerwacje.dataWypozyczenia and rezerwacje.dataZwrotu)))
">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="parametr1" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="parametr2" PropertyName="Text" />
        </SelectParameters>
    </asp:SqlDataSource>
    Należność za wybrany samochód w podanym terminie<br />
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3">
        <Columns>
            <asp:BoundField DataField="należność" HeaderText="należność" ReadOnly="True" SortExpression="należność" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="SELECT DATEDIFF(day, @parametr1, @parametr2)*samochody.[stawka dzienna] AS należność from samochody  where samochody.idsamochodu = @parametr;">
        <SelectParameters>
            <asp:ControlParameter ControlID="TextBox1" Name="parametr1" PropertyName="Text" />
            <asp:ControlParameter ControlID="TextBox2" Name="parametr2" PropertyName="Text" />
            <asp:ControlParameter ControlID="DropDownList1" Name="parametr" PropertyName="SelectedValue" />
        </SelectParameters>
    </asp:SqlDataSource>
    <br />
    Złóż rezerwacje<br />
     1. Jeśli nowy klient, dodaj go najpierw do bazy<div class="navbar-collapse collapse">
                    <ul class="nav navbar-nav">
                     <a runat="server" href="~/WebForm3">Klienci</a>
    <br />2. Złóż rezerwację</br>
                        
    <asp:FormView ID="FormView1" runat="server" DataKeyNames="idrezerwacji" DataSourceID="SqlDataSource4">
        <EditItemTemplate>
            idrezerwacji:
            <asp:Label ID="idrezerwacjiLabel1" runat="server" Text='<%# Eval("idrezerwacji") %>' />
            <br />
            idsamochodu:
            <asp:TextBox ID="idsamochoduTextBox" runat="server" Text='<%# Bind("idsamochodu") %>' />
            <br />
            idklienta:
            <asp:TextBox ID="idklientaTextBox" runat="server" Text='<%# Bind("idklienta") %>' />
            <br />
            dataWypozyczenia:
            <asp:TextBox ID="dataWypozyczeniaTextBox" runat="server" Text='<%# Bind("dataWypozyczenia") %>' />
            <br />
            dataZwrotu:
            <asp:TextBox ID="dataZwrotuTextBox" runat="server" Text='<%# Bind("dataZwrotu") %>' />
            <br />
            dataRezerwacji:
            <asp:TextBox ID="dataRezerwacjiTextBox" runat="server" Text='<%# Bind("dataRezerwacji") %>' />
            <br />
            stanPojazdu:
            <asp:TextBox ID="stanPojazduTextBox" runat="server" Text='<%# Bind("stanPojazdu") %>' />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
        </EditItemTemplate>
        <InsertItemTemplate>
            idsamochodu:
            <asp:TextBox ID="idsamochoduTextBox" runat="server" Text='<%# Bind("idsamochodu") %>' />
            <br />
            idklienta:
            <asp:TextBox ID="idklientaTextBox" runat="server" Text='<%# Bind("idklienta") %>' />
            <br />
            dataWypozyczenia:
            <asp:TextBox ID="dataWypozyczeniaTextBox" runat="server" Text='<%# Bind("dataWypozyczenia") %>' />
            <br />
            dataZwrotu:
            <asp:TextBox ID="dataZwrotuTextBox" runat="server" Text='<%# Bind("dataZwrotu") %>' />
            <br />
            dataRezerwacji:
            <asp:TextBox ID="dataRezerwacjiTextBox" runat="server" Text='<%# Bind("dataRezerwacji") %>' />
            <br />
            stanPojazdu:
            <asp:TextBox ID="stanPojazduTextBox" runat="server" Text='<%# Bind("stanPojazdu") %>' />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" />
&nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
        </InsertItemTemplate>
        <ItemTemplate>
            idrezerwacji:
            <asp:Label ID="idrezerwacjiLabel" runat="server" Text='<%# Eval("idrezerwacji") %>' />
            <br />
            idsamochodu:
            <asp:Label ID="idsamochoduLabel" runat="server" Text='<%# Bind("idsamochodu") %>' />
            <br />
            idklienta:
            <asp:Label ID="idklientaLabel" runat="server" Text='<%# Bind("idklienta") %>' />
            <br />
            dataWypozyczenia:
            <asp:Label ID="dataWypozyczeniaLabel" runat="server" Text='<%# Bind("dataWypozyczenia") %>' />
            <br />
            dataZwrotu:
            <asp:Label ID="dataZwrotuLabel" runat="server" Text='<%# Bind("dataZwrotu") %>' />
            <br />
            dataRezerwacji:
            <asp:Label ID="dataRezerwacjiLabel" runat="server" Text='<%# Bind("dataRezerwacji") %>' />
            <br />
            stanPojazdu:
            <asp:Label ID="stanPojazduLabel" runat="server" Text='<%# Bind("stanPojazdu") %>' />
            <br />

            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" />
            &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" />
        </ItemTemplate>
</asp:FormView>
    <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" DeleteCommand="DELETE FROM [rezerwacje] WHERE [idrezerwacji] = @original_idrezerwacji" InsertCommand="INSERT INTO [rezerwacje] ([idsamochodu], [idklienta], [dataWypozyczenia], [dataZwrotu], [dataRezerwacji], [stanPojazdu]) VALUES (@idsamochodu, @idklienta, @dataWypozyczenia, @dataZwrotu, @dataRezerwacji, @stanPojazdu)" SelectCommand="SELECT * FROM [rezerwacje]" UpdateCommand="UPDATE [rezerwacje] SET [idsamochodu] = @idsamochodu, [idklienta] = @idklienta, [dataWypozyczenia] = @dataWypozyczenia, [dataZwrotu] = @dataZwrotu, [dataRezerwacji] = @dataRezerwacji, [stanPojazdu] = @stanPojazdu WHERE [idrezerwacji] = @original_idrezerwacji" OldValuesParameterFormatString="original_{0}">
        <DeleteParameters>
            <asp:Parameter Name="original_idrezerwacji" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="idsamochodu" Type="Int32" />
            <asp:Parameter Name="idklienta" Type="Int32" />
            <asp:Parameter DbType="Date" Name="dataWypozyczenia" />
            <asp:Parameter DbType="Date" Name="dataZwrotu" />
            <asp:Parameter DbType="Date" Name="dataRezerwacji" />
            <asp:Parameter Name="stanPojazdu" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="idsamochodu" Type="Int32" />
            <asp:Parameter Name="idklienta" Type="Int32" />
            <asp:Parameter DbType="Date" Name="dataWypozyczenia" />
            <asp:Parameter DbType="Date" Name="dataZwrotu" />
            <asp:Parameter DbType="Date" Name="dataRezerwacji" />
            <asp:Parameter Name="stanPojazdu" Type="String" />
            <asp:Parameter Name="original_idrezerwacji" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
<br />
Anuluj rezerwację<br />
id rezerwacji<asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
<asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Usuń" />
</asp:Content>
