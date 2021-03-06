<%@ include file="../../fragments/header.jspf" %>
<%-- security attributes --%>
<c:set var="isAdmin" value="false"/>
<%-- Admin --%>
<security:authorize access="hasRole('ROLE_SECRETARY') or hasRole('ROLE_ADMIN')">
    <c:set var="isAdmin" value="true"/>
</security:authorize>

<div class="span-19 colborder ">
    <h2 id='instrument_unavailability'>Instrument Unavailability</h2>
    <ul>
        <c:forEach var="kv" items="${blackoutsByInstrument}">
            <c:set var="instrument" value="${kv.key}"/>
            <li class="instrument siteQualityRadio proposals" name="${instrument}">${instrument}
                <!-- Show existing unavailable dates -->
                <c:set var="blackouts" value="${kv.value}"/>
                <c:forEach var="blackout" items="${blackouts}">
                    <span id="${blackout.id}" class="blackout">
                        <p>
                            <c:if test="${isAdmin}">
                            <a href="#" class="delete_blackout">
                                <img
                    src="/static/images/button_cancel.png" class="blackout-icon"></a> </c:if>&nbsp;Unavailable from <span
                    class="startDate">${blackout.dateRangePersister.dateRange.startDate}</span> through <span
                    class="endDate">${blackout.dateRangePersister.dateRange.endDate}</span>

                        </p>
                    </span>
                </c:forEach>

                <!-- Show '+' icon for new area -->
                <p>
                    <c:if test="${isAdmin}">
                    <a href="#new_${instrument}_blackout" name="new_${instrument}_blackout"
                      id="new_${instrument}_blackout" class="new_blackout">
                        <img src="/static/images/edit_add.png" class="blackout-icon">
                    </a>
                    </c:if>
                </p>
            </li>
        </c:forEach>
        <!-- Hidden span for date picking -->
        <span id="blackout_dates" style="display:none">
            <h2>Instrument Unavailability Period</h2>

            <p>First day unavailable</p>
            <input id="startDatePicker" type="text"/>
            <p>Final day unavailable</p>
            <input id="endDatePicker" type="text"/>
            <p>
                <button type="submit" name="submit" value="submit" id="add_blackout">Add</button>
            </p>
        </span>
        <!-- Hidden template for blackout appearance -->
        <span id="blackout_template" class="blackout" style="display:none">
            <p><a href="#" id="delete_blackout" class="delete_blackout"><img
                    src="/static/images/button_cancel.png" align="absmiddle" class="blackout-icon"></a>&nbsp;Unavailable from <span
                    class="startDate">replaceMe</span> through <span class="endDate">replaceMe</span></p>
        </span>
    </ul>
</div>
<script type="text/javascript">

    $(function() {
        //Create the datepickers
        $('#startDatePicker').datepicker();
        $('#endDatePicker').datepicker();

        //Handle the "+" button: show the date-picking span
        $(".new_blackout").click(function () {
            var id = $(this).attr("id");

            //Show and move the date picking span
            var b = $("#blackout_dates");
            $("#blackout_dates").show();
            b.detach();
            $(this).parent().append(b);

            //Hide all plus buttons
            $(".new_blackout").hide();
        });


        //Grab the data from the data-picking span, hide the span, post the data, and handle the callback
        $("#add_blackout").click(function () {
            var firstDate = $("#startDatePicker").datepicker('getDate');
            var secondDate = $("#endDatePicker").datepicker('getDate');
            if(firstDate.length == 0 || secondDate.length == 0){
                return;
            }
            var startDate = $.datepicker.formatDate('yy-mm-dd', firstDate);
            var endDate = $.datepicker.formatDate('yy-mm-dd', secondDate);
            //Find the owner
            var owningEl = $(this).closest("li");
            //Hide specificier span
            $("#blackout_dates").hide();
            //Create a new blackout
            $('body').css('cursor', 'wait');
            $.post("blackouts",
            { 'instrumentName' : owningEl.attr('name'), 'startDate' : startDate, 'endDate' : endDate},
                    //Callback
                    function (responseData) {
                        try {
                            //Clone the template, set it's values with JSON data, and place it
                            var jsObj = $.parseJSON(responseData);
                            var blackoutId = jsObj['blackoutId'];
                            var blackoutClone = $("#blackout_template").clone();
                            blackoutClone.attr('id', blackoutId);
                            blackoutClone.find(".startDate").text(jsObj['startDate']);
                            blackoutClone.find(".endDate").text(jsObj['endDate']);
                            owningEl.append(blackoutClone);
                            blackoutClone.show();
                        } catch(x) {
                            alert(x);
                        }
                        //Move 'new' button to bottom
                        var pb = owningEl.find(".new_blackout");
                        pb.detach();
                        owningEl.append(pb);
                        //Bring the 'new' buttons back
                        $(".new_blackout").show();
                        $('body').css('cursor', 'auto');
                    });
            });

            //Set up the delete handler for all delete buttons, even those created dynamically (live() method)
            $(".delete_blackout").live('click', function() {
                var id = $(this).closest("span").attr('id');
                $.ajax({
                    type: "DELETE",
                    url: "blackouts/blackout/" + id,
                    success : function (deleteResponse) {
                        $("#" + id).remove();
                    },
                    error : function (failedDelete) {
                        alert("Could not delete blackout. Manually delete blackout id-> '" + id + "' ");
                    }
                });
            });
    });
</script>
<%@ include file="../../fragments/sidebar.jspf" %>
<%@ include file="../../fragments/footer.jspf" %>
