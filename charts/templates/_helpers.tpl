
{{- define "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.fullname" -}}
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


{{- define "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.labels" -}}
helm.sh/chart: {{ include "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.chart" . }}
{{ include "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo339fb7e4-7ac7-4542-898a-8d35393f7851.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}