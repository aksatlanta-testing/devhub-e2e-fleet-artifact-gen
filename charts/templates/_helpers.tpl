
{{- define "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.fullname" -}}
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


{{- define "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.labels" -}}
helm.sh/chart: {{ include "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.chart" . }}
{{ include "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoce1addfb-3f04-46d3-bfa6-9bbd37ab6b55.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}