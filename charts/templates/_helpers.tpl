
{{- define "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.fullname" -}}
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


{{- define "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.labels" -}}
helm.sh/chart: {{ include "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.chart" . }}
{{ include "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo1d3eb521-99cc-4c54-816f-17c117038d3d.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}