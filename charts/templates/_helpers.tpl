
{{- define "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.fullname" -}}
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


{{- define "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}


{{- define "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.labels" -}}
helm.sh/chart: {{ include "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.chart" . }}
{{ include "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.selectorLabels" . }}
kubernetes.azure.com/generator: {{ .Values.generatorLabel }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}


{{- define "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.selectorLabels" -}}
app.kubernetes.io/name: {{ include "go-echoa85d7340-76c8-4fc9-b9a3-fc58b1e18d35.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}