class window.ProgramFileViewer

  program_files: []

  init: ->
    @$program_file_path = $('#program_file_path')
    @$program_file_content = $('#program_file_content')
    @$program_files_tab = $('#program_files_tab')
  

  # add program file
  # @oaram [Integer] program_file_id
  add_program_file: (program_file_id) ->
    @open_program_file program_file_id, program_file_id of @program_files


  # open program file
  # @oaram [Integer] program_file_id
  # @param [Boolean] reopen
  #   true: reopen, false: add
  open_program_file: (program_file_id, reopen) ->

    @$program_files_tab.children().removeClass('active')

    $.ajax({
      url: '/program_files/' + program_file_id
      type: 'GET'
      success: (data) =>

        if reopen
          @$program_files_tab.find("[program_file_id=#{program_file_id}]").addClass 'active'
        else
          @program_files[program_file_id] = {
            name: data.name
            path: data.path
          }

          @add_tab program_file_id

        @$program_file_path.html(data.path)
        @$program_file_content.html(data.content)
    })


  # add li to program files tab
  # @oaram [Integer] program_file_id
  add_tab: (program_file_id) ->

    tab_html = """
      <li class='active' program_file_id='#{program_file_id}'>
        <a href='#' >
          #{@program_files[program_file_id].name}
          <i class='icon-remove' program_file_id='#{program_file_id}'></i>
        </a>

      </li>
    """

    @$program_files_tab.prepend tab_html

    _this = @
    @$program_files_tab.find("[program_file_id=#{program_file_id}]").click do (_this) ->
      (e) ->
        e.preventDefault()
        _this.switch_program_file $(this).attr 'program_file_id'

    @$program_files_tab.find("[program_file_id=#{program_file_id}]").find('i').click do (_this) ->
      (e) ->
        e.preventDefault()
        _this.delete_tab $(this).attr 'program_file_id'


  # delete tab
  # @param [Integer] program_file_id
  delete_tab: (program_file_id) ->

    delete @program_files[program_file_id]
    @$program_files_tab.find("[program_file_id=#{program_file_id}]").remove()



  # switch display program file
  # handled at tab click
  switch_program_file: (program_file_id) ->

    @$program_files_tab.children().each (i, ele) ->
     $(ele).removeClass 'active' 

    @$program_files_tab.find("[program_file_id=#{program_file_id}]").addClass 'active'
    @open_program_file program_file_id, true






