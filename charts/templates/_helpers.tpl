
{{- define "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.fullname" -}}
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


{{- define "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.labels" -}}
helm.sh/chart: {{ include "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.chart" . }}
{{ include "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo3cb18761-5dec-4ee2-865b-0fc25e2ff514.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}