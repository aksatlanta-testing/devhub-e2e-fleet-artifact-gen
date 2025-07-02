
{{- define "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.fullname" -}}
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


{{- define "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.labels" -}}
helm.sh/chart: {{ include "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.chart" . }}
{{ include "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echocbd2ce3e-44a3-40d4-b49b-6c56fcfc5934.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}