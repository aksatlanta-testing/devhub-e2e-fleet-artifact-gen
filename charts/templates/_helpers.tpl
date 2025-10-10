
{{- define "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.fullname" -}}
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


{{- define "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.labels" -}}
helm.sh/chart: {{ include "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.chart" . }}
{{ include "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echo383ab9b3-2de2-447b-8e5e-e086be4c8395.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}