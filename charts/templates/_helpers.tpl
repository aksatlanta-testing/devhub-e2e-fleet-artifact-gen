
{{- define "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.fullname" -}}
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


{{- define "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.labels" -}}
helm.sh/chart: {{ include "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.chart" . }}
{{ include "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo9d2768a5-e9dc-4b2d-b1fd-532e8c6ab298.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}