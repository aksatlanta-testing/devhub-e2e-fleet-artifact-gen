
{{- define "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.fullname" -}}
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


{{- define "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.labels" -}}
helm.sh/chart: {{ include "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.chart" . }}
{{ include "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof3f402c4-7ebe-4215-a3ac-1d2b24cf3caf.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}