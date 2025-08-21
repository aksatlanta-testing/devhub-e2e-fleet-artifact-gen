
{{- define "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.fullname" -}}
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


{{- define "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.labels" -}}
helm.sh/chart: {{ include "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.chart" . }}
{{ include "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo8d5b30fb-fa45-43aa-a67a-b47e9ebd61fa.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}