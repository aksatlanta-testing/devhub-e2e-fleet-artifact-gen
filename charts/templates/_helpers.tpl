
{{- define "go-echo1a97b7e3-4590-4067-838a-387baf563c54.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a97b7e3-4590-4067-838a-387baf563c54.fullname" -}}
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


{{- define "go-echo1a97b7e3-4590-4067-838a-387baf563c54.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1a97b7e3-4590-4067-838a-387baf563c54.labels" -}}
helm.sh/chart: {{ include "go-echo1a97b7e3-4590-4067-838a-387baf563c54.chart" . }}
{{ include "go-echo1a97b7e3-4590-4067-838a-387baf563c54.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1a97b7e3-4590-4067-838a-387baf563c54.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1a97b7e3-4590-4067-838a-387baf563c54.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}