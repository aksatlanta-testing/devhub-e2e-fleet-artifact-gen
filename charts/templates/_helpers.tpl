
{{- define "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.fullname" -}}
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


{{- define "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.labels" -}}
helm.sh/chart: {{ include "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.chart" . }}
{{ include "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo6bd10635-d3d7-4db3-b12a-04cd980ca79a.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}