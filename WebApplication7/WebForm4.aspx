<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication7.WebForm4" MasterPageFile="~/Site.Master"%>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="idzwrotu" DataSourceID="SqlDataSource4">
                <Columns>
                    <asp:BoundField DataField="idzwrotu" HeaderText="idzwrotu" ReadOnly="True" SortExpression="idzwrotu" />
                    <asp:BoundField DataField="idrezerwacji" HeaderText="idrezerwacji" SortExpression="idrezerwacji" />
                    <asp:BoundField DataField="idklienta" HeaderText="idklienta" SortExpression="idklienta" />
                    <asp:BoundField DataField="idsamochodu" HeaderText="idsamochodu" SortExpression="idsamochodu" />
                    <asp:BoundField DataField="stanPojazdu" HeaderText="stanPojazdu" SortExpression="stanPojazdu" />
                    <asp:BoundField DataField="dataZwrotu" HeaderText="dataZwrotu" SortExpression="dataZwrotu" />
                    <asp:BoundField DataField="nrFaktury" HeaderText="nrFaktury" SortExpression="nrFaktury" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="SELECT * FROM [zwroty]"></asp:SqlDataSource>
            Należność za zwrócone samochody<br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="idzwrotu" DataValueField="idzwrotu">
            </asp:DropDownList>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="należność" HeaderText="należność" ReadOnly="True" SortExpression="należność" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="SELECT * FROM [zwroty]"></asp:SqlDataSource>
            Klienci, którzy uszkodzili wypożyczony samochód<br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="select DATEDIFF(day,rezerwacje.dataWypozyczenia, zwroty.dataZwrotu)*samochody.[stawka dzienna] AS należność from zwroty join rezerwacje on zwroty.idrezerwacji = rezerwacje.idrezerwacji join samochody on rezerwacje.idsamochodu = samochody.idsamochodu where zwroty.idzwrotu = @parametr" OnSelecting="SqlDataSource2_Selecting">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="parametr" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="idklienta" DataSourceID="SqlDataSource5">
                <Columns>
                    <asp:BoundField DataField="idklienta" HeaderText="idklienta" InsertVisible="False" ReadOnly="True" SortExpression="idklienta" />
                    <asp:BoundField DataField="nrTelefonu" HeaderText="nrTelefonu" SortExpression="nrTelefonu" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="select klienci.idklienta, nrTelefonu from klienci join zwroty on klienci.idklienta = zwroty.idklienta join rezerwacje on zwroty.idrezerwacji = rezerwacje.idrezerwacji where rezerwacje.stanPojazdu = 'nieuszkodzony' and zwroty.stanPojazdu = 'uszkodzony'"></asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView1" runat="server" DataKeyNames="idzwrotu" DataSourceID="SqlDataSource3">
                <EditItemTemplate>
                    idzwrotu:
                    <asp:Label ID="idzwrotuLabel1" runat="server" Text='<%# Eval("idzwrotu") %>' />
                    <br />
                    idrezerwacji:
                    <asp:TextBox ID="idrezerwacjiTextBox" runat="server" Text='<%# Bind("idrezerwacji") %>' />
                    <br />
                    idklienta:
                    <asp:TextBox ID="idklientaTextBox" runat="server" Text='<%# Bind("idklienta") %>' />
                    <br />
                    idsamochodu:
                    <asp:TextBox ID="idsamochoduTextBox" runat="server" Text='<%# Bind("idsamochodu") %>' />
                    <br />
                    stanPojazdu:
                    <asp:TextBox ID="stanPojazduTextBox" runat="server" Text='<%# Bind("stanPojazdu") %>' />
                    <br />
                    dataZwrotu:
                    <asp:TextBox ID="dataZwrotuTextBox" runat="server" Text='<%# Bind("dataZwrotu") %>' />
                    <br />
                    nrFaktury:
                    <asp:TextBox ID="nrFakturyTextBox" runat="server" Text='<%# Bind("nrFaktury") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    idzwrotu:
                    <asp:TextBox ID="idzwrotuTextBox" runat="server" Text='<%# Bind("idzwrotu") %>' />
                    <br />
                    idrezerwacji:
                    <asp:TextBox ID="idrezerwacjiTextBox" runat="server" Text='<%# Bind("idrezerwacji") %>' />
                    <br />
                    idklienta:
                    <asp:TextBox ID="idklientaTextBox" runat="server" Text='<%# Bind("idklienta") %>' />
                    <br />
                    idsamochodu:
                    <asp:TextBox ID="idsamochoduTextBox" runat="server" Text='<%# Bind("idsamochodu") %>' />
                    <br />
                    stanPojazdu:
                    <asp:TextBox ID="stanPojazduTextBox" runat="server" Text='<%# Bind("stanPojazdu") %>' />
                    <br />
                    dataZwrotu:
                    <asp:TextBox ID="dataZwrotuTextBox" runat="server" Text='<%# Bind("dataZwrotu") %>' />
                    <br />
                    nrFaktury:
                    <asp:TextBox ID="nrFakturyTextBox" runat="server" Text='<%# Bind("nrFaktury") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                </InsertItemTemplate>
                <ItemTemplate>
                    idzwrotu:
                    <asp:Label ID="idzwrotuLabel" runat="server" Text='<%# Eval("idzwrotu") %>' />
                    <br />
                    idrezerwacji:
                    <asp:Label ID="idrezerwacjiLabel" runat="server" Text='<%# Bind("idrezerwacji") %>' />
                    <br />
                    idklienta:
                    <asp:Label ID="idklientaLabel" runat="server" Text='<%# Bind("idklienta") %>' />
                    <br />
                    idsamochodu:
                    <asp:Label ID="idsamochoduLabel" runat="server" Text='<%# Bind("idsamochodu") %>' />
                    <br />
                    stanPojazdu:
                    <asp:Label ID="stanPojazduLabel" runat="server" Text='<%# Bind("stanPojazdu") %>' />
                    <br />
                    dataZwrotu:
                    <asp:Label ID="dataZwrotuLabel" runat="server" Text='<%# Bind("dataZwrotu") %>' />
                    <br />
                    nrFaktury:
                    <asp:Label ID="nrFakturyLabel" runat="server" Text='<%# Bind("nrFaktury") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" />
                    &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Usuń" />
                    &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" DeleteCommand="DELETE FROM [zwroty] WHERE [idzwrotu] = @idzwrotu" InsertCommand="INSERT INTO [zwroty] ([idzwrotu], [idrezerwacji], [idklienta], [idsamochodu], [stanPojazdu], [dataZwrotu], [nrFaktury]) VALUES (@idzwrotu, @idrezerwacji, @idklienta, @idsamochodu, @stanPojazdu, @dataZwrotu, @nrFaktury)" SelectCommand="SELECT * FROM [zwroty]" UpdateCommand="UPDATE [zwroty] SET [idrezerwacji] = @idrezerwacji, [idklienta] = @idklienta, [idsamochodu] = @idsamochodu, [stanPojazdu] = @stanPojazdu, [dataZwrotu] = @dataZwrotu, [nrFaktury] = @nrFaktury WHERE [idzwrotu] = @idzwrotu">
                <DeleteParameters>
                    <asp:Parameter Name="idzwrotu" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="idzwrotu" Type="Int32" />
                    <asp:Parameter Name="idrezerwacji" Type="Int32" />
                    <asp:Parameter Name="idklienta" Type="Int32" />
                    <asp:Parameter Name="idsamochodu" Type="Int32" />
                    <asp:Parameter Name="stanPojazdu" Type="String" />
                    <asp:Parameter DbType="Date" Name="dataZwrotu" />
                    <asp:Parameter Name="nrFaktury" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="idrezerwacji" Type="Int32" />
                    <asp:Parameter Name="idklienta" Type="Int32" />
                    <asp:Parameter Name="idsamochodu" Type="Int32" />
                    <asp:Parameter Name="stanPojazdu" Type="String" />
                    <asp:Parameter DbType="Date" Name="dataZwrotu" />
                    <asp:Parameter Name="nrFaktury" Type="Int32" />
                    <asp:Parameter Name="idzwrotu" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </asp:Content>
