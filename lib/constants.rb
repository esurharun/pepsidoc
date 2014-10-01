module Constants
  VERSION = '0.0.1'.freeze
  HTML_TEMPLATE = %q{
  	<style>
  	@media print {
    html {
        overflow: visible !important;
    }
}
	</style>
  	<% @loaded_data.to_enum.with_index(1) do |vuln,idx| %>
<table border="1px" style="font-family:PT Sans;border:none;">
  <tr>
    <td style="border:none;width:40px;height:60px;background-color:#041E37">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-size:36.0pt;font-family:"PT Sans";color:white'><%= idx %></span></b></p>
    
  </td>
    <td style="border:none;background-color:#133453;" colspan=5></td>
  </tr>
  <tr style="background-color:#4A6B8A">
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>Sceptive-ID</span></b></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='color:white'>Severity</span></b></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='color:white'>Likelihood</span></b></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='color:white'>Advisory ID</span></b></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>Related Product</span></b></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>Affected Versions</span></b></p>
    </td>
  </tr>
  <tr style="height:60px;background-color:#FFEBAA">
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.id %></span></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.severity %></span></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.likelihood %></span></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.advisory_id %></span></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.product %></span></p>
    </td>
    <td style="border:none;width:100px">
      <p  align=center style='text-align:center'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.affected_versions %></span></p>
    </td>
  </tr>
  <% if vuln.synopsis != nil %>
  <tr>
    <td style="border:none;width:100px;background-color:#4A6B8A;text-align:center;vertical-align:top">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>Synopsis:</span></b></p>
    </td>
    <td colspan=5 style="border:none;width:500px">
      <p  align=center style='text-align:left'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.synopsis %>
  </span></p>
    </td>
  </tr>
  <% end %>
  <% if !vuln.description.nil? && !vuln.description.empty? %>
  <tr>
    <td style="border:none;width:100px;background-color:#4A6B8A;text-align:center;vertical-align:top">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>Description:</span></b></p>
    </td>
    <td colspan=5 style="border:none;width:500px">
      <p  align=center style='text-align:left'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.description.gsub! "\n", "<br>" %>
  </span></p>
    </td>
  </tr>
  <% end %>
  <% if !vuln.exploit.nil? && !vuln.exploit.empty? %>
  <tr>
    <td style="border:none;width:100px;background-color:#4A6B8A;text-align:center;vertical-align:top">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>Exploit:</span></b></p>
    </td>
    <td colspan=5 style="border:none;width:500px">
      <p  align=center style='text-align:left'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.exploit.gsub! "\n", "<br>" %>
  </span></p>
    </td>
  </tr>
  <% end %>
  <% if !vuln.solution.nil? && !vuln.solution.empty? %>
  <tr>
    <td style="border:none;width:100px;background-color:#4A6B8A;text-align:center;vertical-align:top">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>Solution:</span></b></p>
    </td>
    <td colspan=5 style="border:none;width:500px">
      <p  align=center style='text-align:left'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.solution.gsub! "\n", "<br>" %>
  </span></p>
    </td>
  </tr>
  <% end %>
  <% if !vuln.references.nil? && !vuln.references.empty? %>
  <tr>
    <td style="border:none;width:100px;background-color:#4A6B8A;text-align:center;vertical-align:top">
      <p  align=center style='text-align:center'><b><span
  lang=EN style='font-family:"PT Sans";color:white'>References:</span></b></p>
    </td>
    <td colspan=5 style="border:none;width:500px">
      <p  align=center style='text-align:left'><span
  lang=EN style='font-family:"PT Sans";color:black'><%= vuln.references.gsub! "\n", "<br>" %>
  </span></p>
    </td>
  </tr>
  <% end %>
  
</table>
<% end %>
  }
end
