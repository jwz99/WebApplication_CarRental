<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm3.aspx.cs" Inherits="WebApplication7.WebForm3" MasterPageFile="~/Site.Master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div>
            Klienci wypożyczalni w podanym terminie<br />
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <br />
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="idklienta,idrezerwacji" DataSourceID="SqlDataSource1" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                <Columns>
                    <asp:BoundField DataField="idklienta" HeaderText="idklienta" InsertVisible="False" ReadOnly="True" SortExpression="idklienta" />
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                    <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
                    <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
                    <asp:BoundField DataField="nrTelefonu" HeaderText="nrTelefonu" SortExpression="nrTelefonu" />
                    <asp:BoundField DataField="nrDowodu" HeaderText="nrDowodu" SortExpression="nrDowodu" />
                    <asp:BoundField DataField="idrezerwacji" HeaderText="idrezerwacji" InsertVisible="False" ReadOnly="True" SortExpression="idrezerwacji" />
                    <asp:BoundField DataField="idsamochodu" HeaderText="idsamochodu" SortExpression="idsamochodu" />
                    <asp:BoundField DataField="idklienta1" HeaderText="idklienta1" SortExpression="idklienta1" />
                    <asp:BoundField DataField="dataWypozyczenia" HeaderText="dataWypozyczenia" SortExpression="dataWypozyczenia" />
                    <asp:BoundField DataField="dataZwrotu" HeaderText="dataZwrotu" SortExpression="dataZwrotu" />
                    <asp:BoundField DataField="dataRezerwacji" HeaderText="dataRezerwacji" SortExpression="dataRezerwacji" />
                    <asp:BoundField DataField="stanPojazdu" HeaderText="stanPojazdu" SortExpression="stanPojazdu" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="select * from klienci join rezerwacje on klienci.idklienta = rezerwacje.idklienta
where @parametr between rezerwacje.dataWypozyczenia and rezerwacje.dataZwrotu">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="parametr" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
            Klienci, którzy wypożyczali wybrany samochód<br />
            <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="marka" DataValueField="marka">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="SELECT * FROM [samochody]"></asp:SqlDataSource>
            <br />
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="idklienta" DataSourceID="SqlDataSource3">
                <Columns>
                    <asp:BoundField DataField="idklienta" HeaderText="idklienta" InsertVisible="False" ReadOnly="True" SortExpression="idklienta" />
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                    <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
                    <asp:BoundField DataField="nrTelefonu" HeaderText="nrTelefonu" SortExpression="nrTelefonu" />
                    <asp:BoundField DataField="nrDowodu" HeaderText="nrDowodu" SortExpression="nrDowodu" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="select klienci.idklienta, klienci.nazwisko, klienci.miasto, klienci.nrTelefonu, klienci.nrDowodu from klienci join rezerwacje on klienci.idklienta = rezerwacje.idklienta join samochody on rezerwacje.idsamochodu = samochody.idsamochodu where @parametr = samochody.marka">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="parametr" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            Historia wypożyczeń danego klienta<br />
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource5" DataTextField="idklienta" DataValueField="idklienta">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="SELECT * FROM [klienci]"></asp:SqlDataSource>
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="idrezerwacji,idklienta1" DataSourceID="SqlDataSource6">
                <Columns>
                    <asp:BoundField DataField="idrezerwacji" HeaderText="idrezerwacji" InsertVisible="False" ReadOnly="True" SortExpression="idrezerwacji" />
                    <asp:BoundField DataField="idsamochodu" HeaderText="idsamochodu" SortExpression="idsamochodu" />
                    <asp:BoundField DataField="idklienta" HeaderText="idklienta" SortExpression="idklienta" />
                    <asp:BoundField DataField="dataWypozyczenia" HeaderText="dataWypozyczenia" SortExpression="dataWypozyczenia" />
                    <asp:BoundField DataField="dataZwrotu" HeaderText="dataZwrotu" SortExpression="dataZwrotu" />
                    <asp:BoundField DataField="dataRezerwacji" HeaderText="dataRezerwacji" SortExpression="dataRezerwacji" />
                    <asp:BoundField DataField="stanPojazdu" HeaderText="stanPojazdu" SortExpression="stanPojazdu" />
                    <asp:BoundField DataField="idklienta1" HeaderText="idklienta1" InsertVisible="False" ReadOnly="True" SortExpression="idklienta1" />
                    <asp:BoundField DataField="nazwisko" HeaderText="nazwisko" SortExpression="nazwisko" />
                    <asp:BoundField DataField="adres" HeaderText="adres" SortExpression="adres" />
                    <asp:BoundField DataField="miasto" HeaderText="miasto" SortExpression="miasto" />
                    <asp:BoundField DataField="nrTelefonu" HeaderText="nrTelefonu" SortExpression="nrTelefonu" />
                    <asp:BoundField DataField="nrDowodu" HeaderText="nrDowodu" SortExpression="nrDowodu" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" SelectCommand="select * from rezerwacje join klienci on rezerwacje.idklienta = klienci.idklienta where klienci.idklienta = @parametr">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="parametr" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            <asp:FormView ID="FormView2" runat="server" DataKeyNames="idklienta" DataSourceID="SqlDataSource4">
                <EditItemTemplate>
                    idklienta:
                    <asp:Label ID="idklientaLabel1" runat="server" Text='<%# Eval("idklienta") %>' />
                    <br />
                    nazwisko:
                    <asp:TextBox ID="nazwiskoTextBox" runat="server" Text='<%# Bind("nazwisko") %>' />
                    <br />
                    adres:
                    <asp:TextBox ID="adresTextBox" runat="server" Text='<%# Bind("adres") %>' />
                    <br />
                    miasto:
                    <asp:TextBox ID="miastoTextBox" runat="server" Text='<%# Bind("miasto") %>' />
                    <br />
                    nrTelefonu:
                    <asp:TextBox ID="nrTelefonuTextBox" runat="server" Text='<%# Bind("nrTelefonu") %>' />
                    <br />
                    nrDowodu:
                    <asp:TextBox ID="nrDowoduTextBox" runat="server" Text='<%# Bind("nrDowodu") %>' />
                    <br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Aktualizuj" />
                    &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                </EditItemTemplate>
                <InsertItemTemplate>
                    nazwisko:
                    <asp:TextBox ID="nazwiskoTextBox" runat="server" Text='<%# Bind("nazwisko") %>' />
                    <br />
                    adres:
                    <asp:TextBox ID="adresTextBox" runat="server" Text='<%# Bind("adres") %>' />
                    <br />
                    miasto:
                    <asp:TextBox ID="miastoTextBox" runat="server" Text='<%# Bind("miasto") %>' />
                    <br />
                    nrTelefonu:
                    <asp:TextBox ID="nrTelefonuTextBox" runat="server" Text='<%# Bind("nrTelefonu") %>' />
                    <br />
                    nrDowodu:
                    <asp:TextBox ID="nrDowoduTextBox" runat="server" Text='<%# Bind("nrDowodu") %>' />
                    <br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Wstaw" />
                    &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Anuluj" />
                </InsertItemTemplate>
                <ItemTemplate>
                    idklienta:
                    <asp:Label ID="idklientaLabel" runat="server" Text='<%# Eval("idklienta") %>' />
                    <br />
                    nazwisko:
                    <asp:Label ID="nazwiskoLabel" runat="server" Text='<%# Bind("nazwisko") %>' />
                    <br />
                    adres:
                    <asp:Label ID="adresLabel" runat="server" Text='<%# Bind("adres") %>' />
                    <br />
                    miasto:
                    <asp:Label ID="miastoLabel" runat="server" Text='<%# Bind("miasto") %>' />
                    <br />
                    nrTelefonu:
                    <asp:Label ID="nrTelefonuLabel" runat="server" Text='<%# Bind("nrTelefonu") %>' />
                    <br />
                    nrDowodu:
                    <asp:Label ID="nrDowoduLabel" runat="server" Text='<%# Bind("nrDowodu") %>' />
                    <br />
                    <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edytuj" />
                    &nbsp;&nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="Nowy" />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:Baza_danych_wypożyczalniaConnectionString %>" DeleteCommand="DELETE FROM [klienci] WHERE [idklienta] = @idklienta" InsertCommand="INSERT INTO [klienci] ([nazwisko], [adres], [miasto], [nrTelefonu], [nrDowodu]) VALUES (@nazwisko, @adres, @miasto, @nrTelefonu, @nrDowodu)" SelectCommand="SELECT * FROM [klienci]" UpdateCommand="UPDATE [klienci] SET [nazwisko] = @nazwisko, [adres] = @adres, [miasto] = @miasto, [nrTelefonu] = @nrTelefonu, [nrDowodu] = @nrDowodu WHERE [idklienta] = @idklienta">
                <DeleteParameters>
                    <asp:Parameter Name="idklienta" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="nazwisko" Type="String" />
                    <asp:Parameter Name="adres" Type="String" />
                    <asp:Parameter Name="miasto" Type="String" />
                    <asp:Parameter Name="nrTelefonu" Type="Int32" />
                    <asp:Parameter Name="nrDowodu" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="nazwisko" Type="String" />
                    <asp:Parameter Name="adres" Type="String" />
                    <asp:Parameter Name="miasto" Type="String" />
                    <asp:Parameter Name="nrTelefonu" Type="Int32" />
                    <asp:Parameter Name="nrDowodu" Type="String" />
                    <asp:Parameter Name="idklienta" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>
            </div>
</asp:Content>
