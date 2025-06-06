
{{- define "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.fullname" -}}
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


{{- define "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.labels" -}}
helm.sh/chart: {{ include "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.chart" . }}
{{ include "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echof0af26ed-9c7d-45bd-a187-f90443669bea.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}