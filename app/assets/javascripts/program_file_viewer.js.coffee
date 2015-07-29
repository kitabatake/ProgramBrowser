class window.ProgramFileViewer

  program_files: []


  init: ->
    @$program_file_path = $('#program_file_path')
    @$program_file_content = $('#program_file_content')
    @$program_files_tab = $('#program_files_tab')
  
  # add program file
  # @oaram [Integer] program_file_id
  add_program_file: (program_file_id) ->
    @open_program_file program_file_id, true

  # open program file
  # @oaram [Integer] program_file_id
  # @param [Boolean] add
  #   true: add, false: reopen
  open_program_file: (program_file_id, add = false) ->

    $.ajax({
      url: '/programs/' + program_file_id + '/program_file'
      type: 'GET'
      success: (data) =>

        if add
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

    @$program_files_tab.children().each (i, ele) ->
      $(ele)
        .removeClass('active')
        .unbind('click')

    tab_html = """
      <li class='active' program_file_id='#{program_file_id}'>
        <a href='#' >
          #{@program_files[program_file_id].name}
        </a>
      </li>
    """

    @$program_files_tab.prepend tab_html

    _this = @
    @$program_files_tab.children().click do (_this) ->
      (e) ->
        e.preventDefault()
        _this.switch_program_file $(this).attr 'program_file_id'

  # switch display program file
  # handled at tab click
  switch_program_file: (program_file_id) ->

    @$program_files_tab.children().each (i, ele) ->
     $(ele).removeClass 'active' 

    @$program_files_tab.find("[program_file_id=#{program_file_id}]").addClass 'active'
    @open_program_file program_file_id






