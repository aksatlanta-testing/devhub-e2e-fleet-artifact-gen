
{{- define "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.fullname" -}}
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


{{- define "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.labels" -}}
helm.sh/chart: {{ include "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.chart" . }}
{{ include "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo80fb89fc-f3d8-4b8b-886a-16fe1c202cef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}