
{{- define "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.fullname" -}}
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


{{- define "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.labels" -}}
helm.sh/chart: {{ include "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.chart" . }}
{{ include "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo17e4fe10-a985-45c7-b1fd-01954c17249a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}