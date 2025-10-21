
{{- define "go-echoaf162639-582b-41fc-b007-6e939eff4c40.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf162639-582b-41fc-b007-6e939eff4c40.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{- define "go-echoaf162639-582b-41fc-b007-6e939eff4c40.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoaf162639-582b-41fc-b007-6e939eff4c40.labels" -}}
helm.sh/chart: {{ include "go-echoaf162639-582b-41fc-b007-6e939eff4c40.chart" . }}
{{ include "go-echoaf162639-582b-41fc-b007-6e939eff4c40.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoaf162639-582b-41fc-b007-6e939eff4c40.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoaf162639-582b-41fc-b007-6e939eff4c40.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}