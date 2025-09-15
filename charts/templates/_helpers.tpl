
{{- define "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.fullname" -}}
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


{{- define "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.labels" -}}
helm.sh/chart: {{ include "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.chart" . }}
{{ include "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo389f44df-1652-41e9-b228-ab600ab0c4ef.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}