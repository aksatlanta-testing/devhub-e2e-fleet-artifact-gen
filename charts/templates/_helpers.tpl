
{{- define "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.fullname" -}}
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


{{- define "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.labels" -}}
helm.sh/chart: {{ include "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.chart" . }}
{{ include "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa4e3b6cf-2df8-47c3-9677-135396b6ef4e.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}